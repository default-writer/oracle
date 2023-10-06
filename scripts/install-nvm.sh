#!/usr/bin/env bash
set -e

# trunk-ignore(shellcheck/SC2312)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash

export NVM_DIR="${HOME}/.nvm"
# trunk-ignore(shellcheck/SC1091)
[[ -s "${NVM_DIR}/nvm.sh" ]] && \. "${NVM_DIR}/nvm.sh" # This loads nvm
# trunk-ignore(shellcheck/SC1091)
[[ -s "${NVM_DIR}/bash_completion" ]] && \. "${NVM_DIR}/bash_completion" # This loads nvm bash_completion

nvm install --lts

node -v
