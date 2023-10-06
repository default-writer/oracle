#!/usr/bin/env bash
set -e

wait_container_to_be_running() {
	match=$1
	# trunk-ignore(shellcheck/SC2312)
	until docker ps | grep -qm 1 "${match}"; do
		echo "waiting docker '${match}' container to be running..."
		sleep 0.1
	done
}
