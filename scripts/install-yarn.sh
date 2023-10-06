#!/usr/bin/env bash
set -e

# trunk-ignore(shellcheck/SC2312)
curl -o- -L https://yarnpkg.com/install.sh | bash

export PATH="${HOME}/.yarn/bin:${HOME}/.config/yarn/global/node_modules/.bin:${PATH}"

yarn -v
