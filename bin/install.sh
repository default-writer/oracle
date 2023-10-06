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

install="$1"

. "${pwd}/bin/scripts/load.sh"

## Installs dependecies and hooks
## Usage: ${script} <option> [optional]
## ${commands}

case "${install}" in

    "")
        source="all"
        ;;

    "--todo") # installs todo app
        todo="--submodule-todo"
        ;;

    "--api") # installs open api example
        api="--submodule-api"
        ;;

    "--help") # shows command description
        help
        ;;

    *)
        help
        ;;

esac

if [[ "${source}" == "all" || "${todo}" == "--todo" ]]; then
    "${pwd}/bin/utils/install.sh" --todo
fi
if [[ "${source}" == "all" || "${api}" == "--api" ]]; then
    "${pwd}/bin/utils/install.sh" --api
fi

[[ $SHLVL -gt 2 ]] || echo OK

cd "${pwd}"