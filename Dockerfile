FROM registry.gitlab.com/jitesoft/dockerfiles/alpine:latest
ARG DOCKER_VERSION="xx.xx.xx"
LABEL maintainer="Johannes Tegnér <johannes@jitesoft.com>" \
      maintainer.org="Jitesoft" \
      maintainer.org.uri="https://jitesoft.com" \
      com.jitesoft.project.repo.type="git" \
      com.jitesoft.project.repo.uri="https://gitlab.com/jitesoft/dockerfiles/docker" \
      com.jitesoft.project.repo.issues="https://gitlab.com/jitesoft/dockerfiles/docker/issues" \
      com.jitesoft.project.registry.uri="registry.gitlab.com/jitesoft/dockerfiles/docker" \
      com.jitesoft.app.docker.version="${DOCKER_VERSION}"

ENV DOCKER_VERSION=${DOCKER_VERSION}

COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh

RUN apk add --no-cache ca-certificates git openssh-client \
 && [[ ! -e /etc/nsswitch.conf ]] && echo 'hosts: files dns' > /etc/nsswitch.conf \
 && wget -O docker.tgz "https://download.docker.com/linux/static/edge/x86_64/docker-${DOCKER_VERSION}.tgz" \
 && tar -xzf docker.tgz --strip-components 1 -C /usr/local/bin \
 && chmod +x /usr/local/bin/docker \
 && chmod +x /usr/local/bin/dockerd \
 && rm docker.tgz \
 && docker --version \
 && dockerd --version

ENTRYPOINT ["entrypoint.sh"]
