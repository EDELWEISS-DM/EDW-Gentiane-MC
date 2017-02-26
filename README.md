# EDW-Gentiane-MC
EDELWEISS/Gentiane HPGe detector simulation software

## Introduction

TO BE DONE


## Software requirements

The EDW-Gentiane-MC software is known to build and run on:
- Linux (various flavours like Ubuntu 16.04, SL6.X...)
- macOS 10.9.5

The EDW-Gentiane-MC software depends on:
- Cadfaelbrew (https://github.com/SuperNEMO-DBD/brew)
- Bayeux version >= 3.0 (not published yet on GitHub)

## Installation

1. Download the source code:
```sh
$ mkdir -p ${HOME}/softs/EDELWEISS/EDELWEISS-DM
$ cd ${HOME}/softs/EDELWEISS/EDELWEISS-DM
$ git clone https://github.com/EDELWEISS-DM/EDW-Gentiane-MC EDW-Gentiane-MC
$ cd EDW-Gentiane-MC
$ git status
```

2. Enter a Cadfael/brew shell:
```sh
$ brewsh
```

3. Setup Bayeux:
```sh
$ bayeux_dev_setup
```

4. Create a working directory:
```sh
$ mkdir -p /tmp/${USER}/softs/EDW-Gentiane-MC/_build.d
$ cd /tmp/${USER}/softs/EDW-Gentiane-MC/_build.d
```

5. Configure:
```sh
$ cmake
    -DCMAKE_INSTALL_PREFIX:PATH="${HOME}/softs/EDELWEISS/EDELWEISS-DM/EDW-Gentiane-MC-Install-0.1.0" \
    -DBayeux_DIR="$(bxquery --cmakedir)" \
    ${HOME}/softs/EDELWEISS/EDELWEISS-DM/EDW-Gentiane-MC
```

6. Build:
```sh
$ make
```

7. Installation:
```sh
$ make install
```

## Quick install

From the source directory, you may run the ``utility/quick_install.sh``
experimental script to automatically install EDW-Gentiane-MC on your
system. Usage:
```sh
$ ./utility/quick_install.sh --help
```



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

Then, each time you need to use the EDW-Gentiane-MC package, you must setup
a Cadfael/brew shell with Bayeux setup and use:
```sh
$ brewsh
$ bayeux_dev_setup
$ edw_gentiane_mc_setup
$ edw-gentiane-mc-query --prefix
...
$ which edw-gentiane-mc-run
...
```


## Using EDW-Gentiane-MC

TO BE DONE: document the ``edw-gentiane-mc-run`` application.

Usage:
```sh
$ edw-gentiane-mc-run --help
...
```
