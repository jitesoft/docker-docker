FROM registry.gitlab.com/jitesoft/dockerfiles/alpine:latest
ARG DOCKER_VERSION
LABEL maintainer="Johannes Tegnér <johannes@jitesoft.com>" \
      maintainer.org="Jitesoft" \
      maintainer.org.uri="https://jitesoft.com" \
      com.jitesoft.project.repo.type="git" \
      com.jitesoft.project.repo.uri="https://gitlab.com/jitesoft/dockerfiles/docker" \
      com.jitesoft.project.repo.issues="https://gitlab.com/jitesoft/dockerfiles/docker/issues" \
      com.jitesoft.project.registry.uri="registry.gitlab.com/jitesoft/dockerfiles/docker" \
      com.jitesoft.app.docker.version="${DOCKER_VERSION}"

ENV DOCKER_CLI_EXPERIMENTAL="enabled"
ARG DOCKER_VERSION
ARG TARGETPLATFORM

COPY ./entrypoint.sh /usr/local/bin/

RUN apk add --no-cache ca-certificates git openssh-client \
 && [[ ! -e /etc/nsswitch.conf ]] && echo 'hosts: files dns' > /etc/nsswitch.conf \
 && ARCH=$(                     \
    case "${TARGETPLATFORM}" in \
      "linux/amd64")            \
        echo "x86_64"           \
        ;;                      \
      "linux/arm64")            \
        echo "aarch64"          \
        ;;                      \
      "linux/arm/v7")           \
        echo "armhf"            \
        ;;                      \
      "linux/ppc64le")          \
        echo "ppc64le"          \
        ;;                      \
      "linux/s390x")            \
        echo "s390x"            \
        ;;                      \
    esac                        \
 )                              \
 && echo "Architecture: ${TARGETPLATFORM} - ${ARCH}" \
 && cat /etc/apk/arch \
 && wget -O docker.tgz "https://download.docker.com/linux/static/stable/${ARCH}/docker-${DOCKER_VERSION}.tgz" \
 && tar -xzf docker.tgz --strip-components 1 -C /usr/local/bin \
 && chmod +x /usr/local/bin/docker \
 && chmod +x /usr/local/bin/dockerd \
 && chmod +x /usr/local/bin/entrypoint.sh \
 && mkdir -p /root/.docker \
 && echo '{ "experimental": "enabled" }' > /root/.docker/config.json \
 && rm docker.tgz \
 && docker --version \
 && dockerd --version

ENTRYPOINT ["entrypoint.sh"]
CMD ["sh"]
