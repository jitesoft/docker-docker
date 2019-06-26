ARG DOCKER_VERSION
FROM registry.gitlab.com/jitesoft/dockerfiles/docker:${DOCKER_VERSION}
LABEL com.jitesoft.project.registry.uri="registry.gitlab.com/jitesoft/dockerfiles/docker/dind"

COPY dind /usr/local/bin/
COPY entrypoint /usr/bin/entrypoint

RUN apk add --no-cache git btrfs-progs e2fsprogs e2fsprogs-extra iptables xfsprogs xz pigz zfs \
 && addgroup -S dockermap \
 && adduser -S -G dockermap dockermap \
 && echo 'dockermap:165536:65536' >> /etc/subid \
 && echo 'dockermap:165536:65536' >> /etc/subgid \
 && chmod +x /usr/local/bin/dind \
 && chmod +x /usr/local/bin/entrypoint

VOLUME /var/lib/docker
EXPOSE 2375

ENTRYPOINT ["entrypoint"]
CMD []
