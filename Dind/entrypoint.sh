#!/bin/sh
# File taken and slightly modified from https://github.com/docker-library/docker/blob/9633df3ae8a88dfed9ba7f92e8a911249bbe4ec0/18.09/dind/dockerd-entrypoint.sh
set -e

if [[ "$#" -eq 0 ]] || [[ "${1#-}" != "$1" ]]; then
    set -- dockerd --host=unix:///var/run/docker.sock --host=tcp://0.0.0.0:2375 "$@"
fi

if [[ "$1" = 'dockerd' ]]; then
    if [[ -x '/usr/bin/dind' ]]; then
        set -- '/usr/bin/dind' "$@"
    fi
    find /run /var/run -iname 'docker*.pid' -delete
fi
exec "$@"
