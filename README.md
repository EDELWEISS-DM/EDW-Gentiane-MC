# EDW-Gentiane-MC
EDELWEISS/Gentiane HPGe detector simulation software

## Introduction

TO BE DONE


## Software requirements

The EDW-Gentiane-MC software is known to build and run on:
- Linux (various flavours like Ubuntu 16.04, SL6.X...)
- macOS 10.9.5

The EDW-Gentiane-MC software depends on:
- Cadfaelbrew (https://github.com/SuperNEMO-DBD/brew) : a fork of the Homebrew/Linuxbrew package manager
  adapted to data analysis and simulation in experimental High Energy and Nuclear Physics
  (includes Boost, Geant4, ROOT...)
- Bayeux version >= 3.0 (not published yet on GitHub) : a general purpose C++ library
  for data analysis and simulation in experimental High Energy and Nuclear Physics (depends on Cadfaelbrew)

## Installation

1.  Download the source code:

    ```sh
$ mkdir -p ${HOME}/softs/EDELWEISS/EDELWEISS-DM
$ cd ${HOME}/softs/EDELWEISS/EDELWEISS-DM
$ git clone https://github.com/EDELWEISS-DM/EDW-Gentiane-MC EDW-Gentiane-MC
$ cd EDW-Gentiane-MC
$ git status
```
1.  Enter a Cadfael/brew shell:

    ```sh
$ brewsh
```
1.  Setup Bayeux:

	```sh
brewShell$ bayeux_dev_setup
```
1.  Create a working directory:

	```sh
brewShell$ mkdir -p /tmp/${USER}/softs/EDW-Gentiane-MC/_build.d
brewShell$ cd /tmp/${USER}/softs/EDW-Gentiane-MC/_build.d
```
1.  Configure:

	```sh
brewShell$ cmake \
    -DCMAKE_INSTALL_PREFIX:PATH="${HOME}/softs/EDELWEISS/EDELWEISS-DM/EDW-Gentiane-MC-Install-0.1.0" \
    -DBayeux_DIR="$(bxquery --cmakedir)" \
    ${HOME}/softs/EDELWEISS/EDELWEISS-DM/EDW-Gentiane-MC
```
1.  Build:

	```sh
brewShell$ make
```
1.  Installation:

	```sh
brewShell$ make install
```
1.  You can safely remove the build directory:

	```sh
$ rm -fr /tmp/${USER}/softs/EDW-Gentiane-MC/_build.d
```

## Quick install

From the source directory, you may run the ``utility/quick_install.sh``
experimental script to automatically install EDW-Gentiane-MC on your
system.

Usage:

```sh
brewShell$ ./utility/quick_install.sh --help
...
```


## Uninstall

You just have to delete the installation directory and
clean your ``~/.bashrc`` startup script from commands
specific to EDW-Gentiane-MC.

## Setup

In your ``~/.bashrc`` startup script, you should add the typical following lines:

```sh
function do_edw_gentiane_mc_dev_setup()
{
    if [ -z "${CADFAELBREW_INSTALL_DIR}" ]; then
        echo >&2 "[error] Not a Cadfaelbrew shell! Please run 'brewsh'!"
        return 1
    fi
    which bxquery > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo >&2 "[error] Bayeux is not setup!"
        return 1
    fi
    if [ -n "${EDWGENTIANEMC_INSTALL_DIR}" ]; then
        echo >&2 "[warning] EDW-Gentiane-MC is already setup !"
        return 1
    fi
    export EDWGENTIANEMC_INSTALL_DIR="${HOME}/softs/EDELWEISS/EDELWEISS-DM/EDW-Gentiane-MC-Install-0.1.0"
    export PATH="${EDWGENTIANEMC_INSTALL_DIR}/bin:${PATH}"
    echo >&2 "[info] EDW-Gentiane-MC is now setup !"
    return 0;
}
export -f do_edw_gentiane_mc_dev_setup
alias edw_gentiane_mc_setup="do_edw_gentiane_mc_dev_setup"
```

Each time you need to use the EDW-Gentiane-MC package, you must setup
a Cadfael/brew shell with Bayeux setup and use:

```sh
$ brewsh
brewShell$ bayeux_dev_setup
brewShell$ edw_gentiane_mc_setup
brewShell$ edw-gentiane-mc-query --prefix
...
brewShell$ which edw-gentiane-mc-run
...
```


## Using EDW-Gentiane-MC

TO BE DONE: document the ``edw-gentiane-mc-run`` application.

Usage:

```sh
brewShell$ edw-gentiane-mc-run --help
...
```
