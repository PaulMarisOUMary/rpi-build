# syntax=docker/dockerfile:1

ARG DEBIAN_VERSION=trixie

FROM debian:${DEBIAN_VERSION}-slim


RUN apt-get update && apt-get -q -y --no-install-recommends install \
    ca-certificates \
    binfmt-support \
    qemu-user-static \
    debian-archive-keyring \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
    
WORKDIR /opt

ARG RPI_IMAGE_GEN_VERSION=master

RUN git clone --depth 1 --branch ${RPI_IMAGE_GEN_VERSION} https://github.com/raspberrypi/rpi-image-gen.git . \
    && apt-get update && ./install_deps.sh \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /workspace

ENTRYPOINT [ "/opt/rpi-image-gen" ]
CMD [ "--help"]