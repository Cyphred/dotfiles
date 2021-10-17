# !/bin/sh
# Unmounts removable media

# if there are no arguments
[ -z "$1" ] && echo "Target device is unspecified." && exit

# verify the device partition exists
echo "Verifying device partition..."
lsblk -o name,type | grep part | grep $1 || ( echo "\"/dev/$1\" does not exist." && exit )

# verify that the device is already mounted
echo "Checking if the device is already mounted..."
mountpoint=( $(lsblk -o name,mountpoint /dev/$1 | grep $1) )
[[ "${#mountpoint[@]}" == 1 ]] && echo "\"/dev/$1\" is already unmounted." && exit

# get the target's label
echo "Getting the device's label..."
label=$(lsblk -o label /dev/$1 | awk 'END {print $N}')

# get the target's UUID if it does not have a label
[ -z "$label" ] && echo "Device does not have a label. Fetching UUID instead..." && label=$(lsblk -o uuid /dev/$1 | awk 'END {print $N}')

# unmount the device
echo "Unmounting the device..."
sudo umount "/dev/$1" || exit

# removing the device's directory
sudo rmdir "/mnt/$label" || exit

echo "Unmounting complete."
notify-send "Unmounted \"$label\"" "You can now safely remove the device."
