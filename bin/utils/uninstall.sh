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

uid=$(id -u)

if [ "${uid}" -eq 0 ]; then
    echo "Please run as user"
    exit
fi

source=$(pwd)

pwd=$(cd "$(dirname $(dirname $(dirname "${BASH_SOURCE[0]}")))" &> /dev/null && pwd)

install="$1"

. "${pwd}/bin/scripts/load.sh"

## Installs optional dependencies
## Usage: ${script} <option>
## ${commands}

case "${install}" in

    "--todo") # installs rexo as git submodule
        submodule-uninstall https://github.com/default-writer/express-open-api.git ./openapi/express-open-api
        ;;

    "--api") # installs musl as git submodule
        submodule-uninstall https://github.com/default-writer/api-example.git ./openapi/api-example
        ;;

    *)
        help
        exit
        ;;

esac

[[ $SHLVL -gt 2 ]] || echo OK

cd "${pwd}"
