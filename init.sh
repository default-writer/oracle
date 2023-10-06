#!/usr/bin/env bash
set -e

PWD=$(pwd)

git config --global --add safe.directory "${PWD}"

. ./install-nvm.sh
. ./install-yarn.sh
