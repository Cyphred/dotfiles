# !/bin/sh

uuid="UUID=dc2e2556-d262-4bcd-bee2-b1ca8ce76d59"

[ -z "$1" ] && echo "Please specify an action [mount|unmount|eject]." && exit 1
[ "$EUID" -ne 0 ] && echo Missing root privileges. && exit 1

_mount() {
	cryptsetup luksOpen $uuid cryptventoy
	mkdir /mnt/ventoy-secrets/
	chmod 700 /mnt/ventoy-secrets/
	mount /dev/mapper/ventoyvg-secrets /mnt/ventoy-secrets/
}

_unmount() {
	umount /dev/mapper/ventoyvg-secrets
	cryptsetup luksClose /dev/mapper/ventoyvg-secrets
	cryptsetup luksClose /dev/mapper/cryptventoy
	rmdir /mnt/ventoy-secrets
}

if [ "$1" == "mount" ] || [ "$1" == "m" ]; then
	_mount && \
	echo Decrypt and mount successful.
elif [ "$1" == "unmount" ] || [ "$1" == "u" ]; then
	_unmount && \
	echo Encrypt and unmount successful.
fi
