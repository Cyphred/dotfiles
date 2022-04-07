# !/bin/sh

[ "$EUID" -ne 0 ] && echo Missing root privileges. && exit 1
[ -z "$1" ] && echo Please specify a qcow2 image. && exit 1

sudo qemu-nbd --connect=/dev/nbd0 $1
