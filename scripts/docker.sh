#!/usr/bin/env bash
set -e

PWD=$(pwd)

git config --global --add safe.directory "${PWD}"

. "$(dirname "$0")/start-editor.sh"
. "$(dirname "$0")/start-ui.sh"

. $HOME/.bashrc