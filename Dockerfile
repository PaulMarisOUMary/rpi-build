# syntax=docker/dockerfile:1

FROM debian:trixie-slim


RUN apt-get update && apt-get -q -y --no-install-recommends install \
    ca-certificates \
    binfmt-support \
    qemu-user-static \
    debian-archive-keyring \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
    
WORKDIR /opt

RUN git clone --depth 1 https://github.com/raspberrypi/rpi-image-gen.git . \
    && apt-get update && ./install_deps.sh \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /workspace

ENTRYPOINT [ "/opt/rpi-image-gen" ]
