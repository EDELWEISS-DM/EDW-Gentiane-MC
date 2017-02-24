#!/usr/bin/env bash

# Authors: F. Mauger <mauger@lpccaen.in2p3.fr>
#          C. Augier <augier@ipnl.in2p3.fr> (No, it's a joke!)

app_debug=0
app_default_build_dir="$(pwd)/_build.d"
app_default_install_dir="$(pwd)/_install.d"
source_dir="$(pwd)"
build_dir=
install_dir=
no_splash=0

opwd=$(pwd)

function app_splash()
{
    cat<<EOF

=============================================
*                                           *
* EDW-Gentiane-MC Quick Installation Wizard *
*                                           *
* Copyright (C) 2017                        *
* The EDELWEISS Collaboration               *
*                                           *
=============================================

EOF
    return 0
}

function app_exit()
{
    local error_code="$1"
    shift 1
    if [ -n "$1" ]; then
	echo >&2 "[error] $@"
    fi
    cd ${opwd}
    exit ${error_code}
}

function app_help()
{
    cat<<EOF

quick_install.sh - EDW-Gentiane-MC installation wizard script

Usage: quick_install.sh [OPTIONS]

Options:

  --help         Print this help then exit
  --build-dir    Choose de build temporary directory
  --install-dir  Choose de installation directory
  --no-splash    Do not print the splash screen

Example:

  quick_install.sh \\
     --build-dir "/tmp/\${USER}/_build.d" \\
     --install-dir "\${HOME}/Software/EDW-Gentiane-MC/install"

EOF
    return
}

function app_dialog()
{
    # echo >&2 "[debug] app_dialog: Entering..."
    while [ -n "$1" ]; do
	local opt="$1"
	# echo >&2 "[debug] opt = '${opt}'"
	if [ "${opt}" == "--install-dir" ]; then
	    shift 1
	    install_dir="$1"
	elif [ "${opt}" == "--build-dir" ]; then
	    shift 1
	    build_dir="$1"
	elif [ "${opt}" == "--no-splash" ]; then
	    no_splash=1
	elif [ "${opt}" == "--help" ]; then
	    app_help
	    app_exit 0
	fi
	shift 1
    done
    # echo >&2 "[debug] app_dialog: Exiting."
    return 0
}

app_dialog $@
if [ ${no_splash} -eq 0 ]; then
    app_splash
fi

which brew > /dev/null 2>&1
if [ $? -ne 0 ]; then
    app_exit 1 "No brew shell available! Abort!"
fi

which bxquery > /dev/null 2>&1
if [ $? -ne 0 ]; then
    app_exit 1 "Missing Bayeux! Abort!"
fi

if [ -z "${build_dir}" ]; then
    build_dir="${app_default_build_dir}"
fi
if [ -z "${install_dir}" ]; then
    install_dir="${app_default_install_dir}"
fi

echo >&2 "[info] build directory   = '${build_dir}'"
echo >&2 "[info] install directory = '${install_dir}'"
echo >&2 "[info] Bayeux prefix     = '$(bxquery --prefix)'"

if [ -d ${build_dir} ]; then
    echo >&2 "[info] Remove old build directory..."
    rm -fr ${build_dir}
fi

if [ -d ${install_dir} ]; then
    echo >&2 "[info] Remove old install directory..."
    rm -fr ${install_dir}
fi

echo >&2 "[info] Creating build directory..."
mkdir -p  ${build_dir}
if [ $? -ne 0 ]; then
    app_exit 1 "Build directory creation failed! Abort!"
fi

cd ${build_dir}

configuration_log="$(pwd)/_configuration.log"
build_log="$(pwd)/_build.log"
installation_log="$(pwd)/_installation.log"

echo >&2 "[info] Configuration..."
cmake \
    -DCMAKE_INSTALL_PREFIX=${install_dir} \
    -DBayeux_DIR=$(bxquery --cmakedir) \
    .. \
    > ${configuration_log} 2>&1
if [ $? -ne 0 ]; then
    app_exit 1 "Configuration failed! Abort! Please check '${configuration_log}'!"
fi

echo >&2 "[info] Build..."
make \
    > ${build_log} 2>&1
if [ $? -ne 0 ]; then
    app_exit 1 "Build failed! Abort! Please check '${build_log}'!"
fi

echo >&2 "[info] Installation..."
make install\
     > ${installation_log} 2>&1
if [ $? -ne 0 ]; then
    app_exit 1 "Installation failed! Abort! Please check '${installation_log}'!"
fi

# Back to origin dir:
cd ${opwd}

echo >&2 "[info] The EDW-Gentiane-MC package has been successfully installed in : '${install_dir}'"

LANG="C" tree ${install_dir} >&2

bash_rc="${HOME}/.bash.edw-gentiane-mc.sample"
touch ${bash_rc}
cat > ${bash_rc} <<EOF
# -*- mode: shell-script; -*-
export EDWGENTIANEMC_SOURCE_DIR="$(pwd)"
echo >&2 "[info] Type 'edw_gentiane_mc_setup' to setup EDW-Gentiane-MC !"
echo >&2 "[info] Type 'go_edw_gentiane_mc' to cd in the EDW-Gentiane-MC source directory!"

function do_edw_gentiane_mc_dev_setup()
{
    if [ -z "\${CADFAELBREW_INSTALL_DIR}" ]; then
        echo >&2 "[error] Not a Cadfaelbrew shell! Please run 'brewsh'!"
        return 1
    fi
    which bxquery > /dev/null 2>&1
    if [ \$? -ne 0 ]; then
        echo >&2 "[error] Bayeux is not setup!"
        return 1
    fi
    if [ -n "${EDWGENTIANEMC_INSTALL_DIR}" ]; then
        echo >&2 "[warning] EDW-Gentiane-MC is already setup !"
        return 1
    fi
    export EDWGENTIANEMC_INSTALL_DIR="${install_dir}"
    export PATH="\${EDWGENTIANEMC_INSTALL_DIR}/bin:\${PATH}"
    echo >&2 "[info] EDW-Gentiane-MC is now setup !"
    return 0;
}
export -f do_edw_gentiane_mc_dev_setup
alias go_edw_gentiane_mc="cd \${EDWGENTIANEMC_SOURCE_DIR}"
alias edw_gentiane_mc_setup="do_edw_gentiane_mc_dev_setup"

EOF

app_exit 0

# end
