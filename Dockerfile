FROM registry.gitlab.com/jitesoft/dockerfiles/alpine:latest
ARG DOCKER_VERSION="xx.xx.xx"
LABEL maintainer.repo="https://gitlab.com/jitesoft/dockerfiles/docker" \
      maintainer.issues="https://gitlab.com/jitesoft/dockerfiles/docker/issues" \
      docker.version="${DOCKER_VERSION}-ce"

ENV DOCKER_VERSION=${DOCKER_VERSION}

COPY ./entrypoint.sh /usr/bin/entrypoint.sh

RUN apk add --no-cache ca-certificates \
 && [[ ! -e /etc/nsswitch.conf ]] && echo 'hosts: files dns' > /etc/nsswitch.conf \
 && echo  "https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}-ce.tgz" \
 && wget -O docker.tgz "https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}-ce.tgz" \
 && tar -xzf docker.tgz --strip-components 1 -C /usr/bin \
 && rm docker.tgz

ENTRYPOINT ["entrypoint.sh"]
