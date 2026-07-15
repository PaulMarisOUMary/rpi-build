#!/bin/sh
set -eu

: "${IMAGE_NAME:?IMAGE_NAME required}"
: "${KERNEL_NAME:?KERNEL_NAME required}"
: "${DTB_NAME:?DTB_NAME required}"
: "${INITRD_NAME:=}"

SRC_IMG_DIR="/workspace/image-${IMAGE_NAME}"
SRC_IMG_PATH="${SRC_IMG_DIR}/${IMAGE_NAME}.img"

if [ ! -f "$SRC_IMG_PATH" ]; then
    echo "Image could not be found: $SRC_IMG_PATH" >&2
    exit 1
fi
echo "Using image: $SRC_IMG_PATH"

WORKTMP=$(mktemp -d)
trap 'rm -rf "$WORKTMP"' EXIT

RUN_IMG_PATH="$WORKTMP/${IMAGE_NAME}.img"
cp --reflink=auto "$SRC_IMG_PATH" "$RUN_IMG_PATH" 2>/dev/null || cp "$SRC_IMG_PATH" "$RUN_IMG_PATH"

CURRENT_SIZE=$(stat -c %s "$RUN_IMG_PATH")
NEW_SIZE=1
while [ "$NEW_SIZE" -lt "$CURRENT_SIZE" ]; do
    NEW_SIZE=$((NEW_SIZE * 2))
done

if [ "$NEW_SIZE" -ne "$CURRENT_SIZE" ]; then
    echo "Resizing image: ${CURRENT_SIZE} -> ${NEW_SIZE} bytes"
    qemu-img resize -f raw "$RUN_IMG_PATH" "$NEW_SIZE"
fi

# BOOT_OFFSET=$(parted -m -s "$RUN_IMG_PATH" unit B print \
#     | awk -F: '$1==1 { gsub("B","",$2); print $2 }')

# if [ -z "$BOOT_OFFSET" ]; then
#     echo "Boot partition location failed in $RUN_IMG_PATH" >&2
#     exit 1
# fi

BOOT_OFFSET=$(parted -ms "$RUN_IMG_PATH" unit B print 2>/dev/null | awk -F: '$5 ~ /fat/ {gsub("B","",$2); print $2}' | head -n1)
if [ -z "$BOOT_OFFSET" ]; then
    echo "ERROR: could not find a FAT (boot) partition in $IMG" >&2
    parted -ms "$RUN_IMG_PATH" unit B print >&2 || true
    exit 1
fi
echo "Boot partition offset: ${BOOT_OFFSET} bytes"

echo "=== Files inside boot partition ==="
mdir -i "${RUN_IMG_PATH}@@${BOOT_OFFSET}" -b ::
echo "==================================="

mcopy -n -i "${RUN_IMG_PATH}@@${BOOT_OFFSET}" "::${KERNEL_NAME}" "$WORKTMP/kernel"
mcopy -n -i "${RUN_IMG_PATH}@@${BOOT_OFFSET}" "::${DTB_NAME}" "$WORKTMP/dtb"

QEMU_EXTRA_ARGS=""
if [ -n "${INITRD_NAME:-}" ]; then
    mcopy -n -i "${RUN_IMG_PATH}@@${BOOT_OFFSET}" "::${INITRD_NAME}" "$WORKTMP/initrd"
    QEMU_EXTRA_ARGS="-initrd $WORKTMP/initrd"
fi

echo "Extraction complete."

echo "Starting QEMU..."

qemu-system-aarch64 \
    -M raspi3b \
    -cpu cortex-a53 \
    -m 1G \
    -smp 4 \
    -kernel "$WORKTMP/kernel" \
    -dtb "$WORKTMP/dtb" \
    -drive file="${RUN_IMG_PATH}",format=raw,if=sd \
    $QEMU_EXTRA_ARGS \
    -append "earlycon=pl011,mmio32,0x3f201000 root=/dev/mmcblk0p2 console=ttyAMA1,115200 rw rootwait loglevel=8 systemd.debug_shell_tty=ttyAMA1 init=/bin/bash" \
    -netdev user,id=net0,hostfwd=tcp::2222-:22 \
    -device usb-net,netdev=net0 \
    -no-reboot \
    -serial mon:stdio \
    -serial null \
    -display none


    # -serial null \
    # -append systemd.mask=boot-firmware.mount systemd.debug_shell=1 systemd.debug_shell_tty=ttyAMA1" \
    # -usb -device usb-mouse -device usb-kbd \