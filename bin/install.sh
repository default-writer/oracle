#!/usr/bin/env bash
if [[ "${BASHOPTS}" != *extdebug* ]]; then
    set -e
fi

err_report() {
    cd ${source}
    echo "ERROR: $0:$*"
    exit 8
}

if [[ "${BASHOPTS}" != *extdebug* ]]; then
    trap 'err_report $LINENO' ERR
fi

source=$(pwd)

pwd=$(cd "$(dirname $(dirname "${BASH_SOURCE[0]}"))" &> /dev/null && pwd)

cd "${pwd}"

uid=$(id -u)

if [ "${uid}" -eq 0 ]; then
    echo "Please run as user"
    exit
fi

. "${pwd}/bin/scripts/load.sh"

## Installs dependecies and hooks
## Usage: ${script} <option> [optional]
## ${commands}

source="all"

while (($#)); do
    case "$1" in

        "")
            ;;

        "--install") # installs packages
            install="--install"
            ;;

        "--uninstall") # uninstalls packages
            uninstall="--uninstall"
            ;;

        "--todo") # todo app
            todo="--todo"
            ;;

        "--api") # open api example
            api="--api"
            ;;

        "--help") # shows command description
            help
            ;;

        *)
            help
            ;;
    esac
    shift
done

if [[ "${source}" == "all" || "${todo}" == "--todo" ]]; then
    if [[ "${install}" == "--install" ]]; then
        "${pwd}/bin/utils/install.sh" --todo
    fi
    if [[ "${uninstall}" == "--uninstall" ]]; then
        "${pwd}/bin/utils/uninstall.sh" --todo
    fi
fi
if [[ "${source}" == "all" || "${api}" == "--api" ]]; then
    "${pwd}/bin/utils/install.sh" --api
fi

[[ $SHLVL -gt 2 ]] || echo OK

cd "${pwd}"
