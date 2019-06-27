ARG DOCKER_VERSION
FROM registry.gitlab.com/jitesoft/dockerfiles/docker:${DOCKER_VERSION}
LABEL com.jitesoft.project.registry.uri="registry.gitlab.com/jitesoft/dockerfiles/docker/dind"

COPY dind /usr/local/bin/
COPY entrypoint-dind /usr/local/bin

RUN apk add --no-cache git btrfs-progs e2fsprogs e2fsprogs-extra iptables xfsprogs xz pigz zfs \
 && addgroup -S dockeremap \
 && adduser -S -G dockeremap dockeremap \
 && echo 'dockeremap:165536:65536' >> /etc/subuid \
 && echo 'dockeremap:165536:65536' >> /etc/subgid \
 && chmod +x /usr/local/bin/dind \
 && chmod +x /usr/local/bin/entrypoint-dind

VOLUME /var/lib/docker
EXPOSE 2375

ENTRYPOINT ["entrypoint-dind"]
CMD []
