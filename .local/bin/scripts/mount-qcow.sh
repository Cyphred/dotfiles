# !/bin/sh

[ "$EUID" -ne 0 ] && echo Missing root privileges. && exit 1
[ -z "$1" ] && echo Please specify a qcow2 image. && exit 1

modprobe nbd max_part=8 || exit 1

qemu-nbd --connect=/dev/nbd0 $1 || exit 1

fdisk /dev/nbd0 -l
