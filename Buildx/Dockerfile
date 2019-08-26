ARG DOCKER_VERSION
FROM registry.gitlab.com/jitesoft/dockerfiles/docker:${DOCKER_VERSION}
LABEL com.jitesoft.project.registry.uri="registry.gitlab.com/jitesoft/dockerfiles/docker/buildx"
RUN mkdir -p /root/.docker/cli-plugins \
 && mkdir -p /root/.docker/buildx/instances \
 && apk add --no-cache qemu
COPY ./docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod +x /root/.docker/cli-plugins/docker-buildx
