ARG DOCKER_VERSION
FROM registry.gitlab.com/jitesoft/dockerfiles/docker:${DOCKER_VERSION}
LABEL com.jitesoft.project.registry.uri="registry.gitlab.com/jitesoft/dockerfiles/docker/experimental"

RUN mkdir -p /root/.docker/cli-plugins \
 && mkdir -p /root/.docker/buildx/instances \
 && BUILDX_VERSION=$(wget -qO- https://github.com/docker/buildx/releases/latest | grep -oP '(?<=releases\/tag\/)(.*?)(?=\&)' | awk 'NR==1{print $1}') \
 && wget -O /root/.docker/cli-plugins/docker-buildx https://github.com/docker/buildx/archive/buildx-${BUILDX_VERSION}.linux-amd64 \
 && chmod +x /root/.docker/cli-plugins/docker-builx

COPY ./Buildx/buildx-multiarch /root/.docker/buildx/instances
