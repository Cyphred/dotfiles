# !/bin/sh
# A dmenu script for mounting/unmounting MTP devices

_mount() {
	if mkdir -p $2; then
		if simple-mtpfs --device $1 $2; then
			notify-send "MTP device mounted" "Mounted $3 to $2"
		else
			notify-send -u critical "Could not mount MTP device" "Error mounting $1 to $2"
			exit 1
		fi
	else
			notify-send -u critical "Could not mount MTP device" "Error creating $2"
			exit 1
	fi
}

_unmount() {
	if fusermount -u $1; then
		if rmdir $1; then
			notify-send "MTP device unmounted" "Unmounted $1"
		else
			notify-send -u critical "MTP device unmounted with errors" "Could not delete directory $1"
		fi
	else
		notify-send -u critical "Could not unmount MTP device" "Error unmounting $1"
	fi
}

# Get list of MTP devices
operation=$(printf "mount\nunmount" | dmenu)
[ "$operation" == "mount" ] || [ "$operation" == "unmount" ] || exit 1
devices=$(simple-mtpfs --list-devices)

# Check if there are no devices
if [ -z "$devices" ]; then
	notify-send "MTP Mounting" "No devices found"
	exit 1
fi

# Pick a device
selection=$(printf "$devices" | dmenu -l 5)
[ -z "$selection" ] && exit 1
deviceNumber="${selection:0:1}"
deviceName="device$deviceNumber"
mountpoint="$HOME/mnt/$deviceName"
[ "$operation" == "mount" ] && _mount $deviceNumber $mountpoint $selection
[ "$operation" == "unmount" ] && _unmount $mountpoint $selection
