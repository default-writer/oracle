#!/usr/bin/env bash
set -e

git config --global --add safe.directory $(pwd)

. ./install-nvm.sh
. ./install-yarn.sh

