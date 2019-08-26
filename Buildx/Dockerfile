ARG DOCKER_VERSION
FROM registry.gitlab.com/jitesoft/dockerfiles/docker:${DOCKER_VERSION}
LABEL com.jitesoft.project.registry.uri="registry.gitlab.com/jitesoft/dockerfiles/docker/experimental"
RUN mkdir -p /root/.docker/cli-plugins \
 && mkdir -p /root/.docker/buildx/instances

COPY ./Buildx/buildx-multiarch /root/.docker/buildx/instances
COPY ./docker-buildx /root/.docker/cli-plugins/docker-buildx

RUN chmod +x /root/.docker/cli-plugins/docker-buildx
