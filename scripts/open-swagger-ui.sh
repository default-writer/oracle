#!/usr/bin/env bash
set -e

#
# Usage: run from project directory: ./scripts/open_swagger_editor.sh
# Description: run docker with openapi.yml & open browser with swagger editor
# Prerequirements: docker
#

PWD=$(pwd)

. "$(dirname "$0")/common.sh"

# run swagger-editor container with the yaml, if not running yet
# opening specific file doesn't work with editor
name='swagger-ui'
command -v docker >/dev/null 2>&1 || {
	echo >&2 "'docker' is not install installed. Aborting."
	exit 1
}

# trunk-ignore(shellcheck/SC2312)
[[ "$(docker ps -f "name=${name}" --format '{{.Names}}')" == "${name}" ]] || docker run --rm -d -p 8045:8080 --name "${name}" -e SWAGGER_JSON=/config/openapi.yml -v "${PWD}"/config:/config swaggerapi/swagger-ui

wait_container_to_be_running "${name}" & sleep 2
