#!/usr/bin/env bash
set -e

PWD=$(pwd)

git config --global --add safe.directory "${PWD}"

. "$(dirname "$0")/install-nvm.sh"
. "$(dirname "$0")/install-yarn.sh"
