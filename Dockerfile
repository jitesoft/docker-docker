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

ENV DOCKER_VERSION=${DOCKER_VERSION} \
    DOCKER_CLI_EXPERIMENTAL="enabled"

COPY ./entrypoint.sh /usr/local/bin/

RUN apk add --no-cache ca-certificates git openssh-client \
 && [[ ! -e /etc/nsswitch.conf ]] && echo 'hosts: files dns' > /etc/nsswitch.conf \
 && ARCH=$( \
    ${TARGETPLATFORM} = "linux/amd64"   && echo "x86_64"  || \
    ${TARGETPLATFORM} = "linux/arm64"   && echo "aarch64" || \
    ${TARGETPLATFORM} = "linux/arm/v7"  && echo "armhf"   || \
    ${TARGETPLATFORM} = "linux/ppc64le" && echo "ppc64le" || \
    ${TARGETPLATFORM} = "linux/s390x"   && echo "s390x"   || \
    ${TARGETPLATFORM} = "linux/arm/v6"  && echo "Architecture not supported"; exit 1; || \
    ${TARGETPLATFORM} = "linux/386"     && echo "Architecture not supported."; exit 1; \
  ) \
 && wget -O docker.tgz "https://download.docker.com/linux/static/edge/${ARCH}/docker-${DOCKER_VERSION}.tgz" \
 && tar -xzf docker.tgz --strip-components 1 -C /usr/local/bin \
 && chmod +x /usr/local/bin/docker \
 && chmod +x /usr/local/bin/dockerd \
 && chmod +x /usr/local/bin/entrypoint.sh \
 && mkdir -p /etc/docker \
 && echo '{ "experimental": true }' > /etc/docker/daemon.json \
 && mkdir -p /root/.docker \
 && echo '{ "experimental": "enabled" }' > /root/.docker/config.json \
 && rm docker.tgz \
 && docker --version \
 && dockerd --version

ENTRYPOINT ["entrypoint.sh"]
CMD ["sh"]
