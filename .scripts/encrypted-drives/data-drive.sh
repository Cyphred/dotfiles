# !/bin/sh
# Mounts the Media Drive

uuid="UUID=7c496cd8-5252-44e6-bb22-1e7bb6d4d27c"

[ -z "$1" ] && echo "Please specify an action [mount|unmount|eject]." && exit 1
[ "$EUID" -ne 0 ] && echo Missing root privileges. && exit 1

_mount() {
	cryptsetup -d /secrets/thiccpad/data.key luksOpen $uuid cryptdata && \
	mount /dev/mapper/vg2-data /mnt/data/
}

_unmount() {
	umount /dev/mapper/vg2-data
	cryptsetup luksClose /dev/mapper/vg2-data && \
	cryptsetup luksClose /dev/mapper/cryptdata
}

_eject() {
	hdparm -S 1 /dev/disk/by-uuid/7c496cd8-5252-44e6-bb22-1e7bb6d4d27c
}


if [ "$1" == "mount" ] || [ "$1" == "m" ]; then
	_mount && \
	echo Decrypt and mount successful.
elif [ "$1" == "unmount" ] || [ "$1" == "u" ]; then
	_unmount && \
	echo Encrypt and unmount successful.
elif [ "$1" == "eject" ] || [ "$1" == "e" ]; then
	_unmount && _eject && \
	echo Eject successful.
fi
