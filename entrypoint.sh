#!/bin/sh
# File taken and slightly modified from https://github.com/docker-library/docker/blob/9633df3ae8a88dfed9ba7f92e8a911249bbe4ec0/18.09/docker-entrypoint.sh

set -e
if [[ "${1#-}" != "$1" ]]; then
    set -- docker "$@"
fi
if docker help "$1" > /dev/null 2>&1; then
    set -- docker "$@"
fi
if [[ -z "$DOCKER_HOST" && "$DOCKER_PORT_2375_TCP" ]]; then
    export DOCKER_HOST='tcp://docker:2375'
fi
exec "$@"
