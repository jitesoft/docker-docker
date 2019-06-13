ARG DOCKER_VERSION
FROM registry.gitlab.com/jitesoft/dockerfiles/docker:${DOCKER_VERSION}

COPY dind /usr/local/bin/
COPY entrypoint.sh /usr/bin/entrypoint.sh

RUN apk add --no-cache git btrfs-progs e2fsprogs e2fsprogs-extra iptables xfsprogs xz pigz zfs \
 && addgroup -S dockermap \
 && adduser -S -G dockermap dockermap \
 && echo 'dockermap:165536:65536' >> /etc/subid \
 && echo 'dockermap:165536:65536' >> /etc/subgid \
 && chmod +x /usr/bin/dind \
 && chmod +x /usr/bin/entrypoint.sh

VOLUME /var/lib/docker
EXPOSE 2375

ENTRYPOINT ["entrypoint.sh"]
