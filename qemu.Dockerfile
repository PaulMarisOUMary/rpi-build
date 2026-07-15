# syntax=docker/dockerfile:1

ARG DEBIAN_VERSION=trixie

FROM debian:${DEBIAN_VERSION}-slim


RUN apt-get update && apt-get -q -y --no-install-recommends install \
    qemu-system-arm \
    qemu-system-misc \
    qemu-utils \
    mtools \
    parted \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /workspace

COPY lib/run-qemu.sh /usr/local/bin/run-qemu.sh
RUN chmod +x /usr/local/bin/run-qemu.sh


ENTRYPOINT ["/usr/local/bin/run-qemu.sh"]