ARG DOCKER_VERSION
ARG BUILDX_VERSION
FROM registry.gitlab.com/jitesoft/dockerfiles/docker:${DOCKER_VERSION}
LABEL com.jitesoft.project.registry.uri="registry.gitlab.com/jitesoft/dockerfiles/docker/dind" \
      com.jitesoft.buildx.version="${BUILDX_VERSION}"

ARG BUILDX_VERSION
RUN ARCH=$(echo "${TARGETPLATFORM}" | sed -r 's~/~-~g') \
 && mkdir -p /root/.docker/cli-plugins \
 && mkdir -p /root/.docker/buildx \
 && wget https://github.com/docker/buildx/releases/download/v${BUILDX_VERSION}/buildx-v${BUILDX_VERSION}.${ARCH} -O /root/.docker/cli-plugins/docker-buildx \
 && chmod +x /root/.docker/cli-plugins \
 && docker buildx version
