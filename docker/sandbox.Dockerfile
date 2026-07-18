# syntax=docker/dockerfile:1

ARG DEBIAN_VERSION=trixie

FROM debian:${DEBIAN_VERSION}-slim


RUN apt-get update && apt-get -q -y --no-install-recommends install \
    podman \
    uidmap \
    nftables \
    ca-certificates \
    binfmt-support \
    qemu-user-static \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY lib/sandbox.sh /usr/local/lib/sandbox.sh
COPY bin/sandbox /usr/local/bin/sandbox
RUN chmod 755 /usr/local/bin/sandbox /usr/local/lib/sandbox.sh


WORKDIR /workspace

ENTRYPOINT [ "/usr/local/bin/sandbox" ]