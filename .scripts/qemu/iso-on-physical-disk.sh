# !/bin/sh
# Runs an ISO installer using a physical disk

qemu-system-x86_64 -cdrom $1 -boot order=d -hda $2 -enable-kvm
