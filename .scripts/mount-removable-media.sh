# !/bin/sh
# mounts removable media

# if there are no arguments
[ -z "$1" ] && echo "Target device is unspecified." && exit

# verify the device partition exists
echo "Verifying device partition..."
lsblk -o name,type | grep part | grep $1 || ( echo "\"/dev/$1\" does not exist." && exit )

# verify that the device isn't mounted yet
echo "Checking if the device isn't mounted yet..."
mountpoint=( $(lsblk -o name,mountpoint /dev/$1 | grep $1) )
[[ "${#mountpoint[@]}" -gt 1 ]] && echo "\"/dev/$1\" is already mounted." && exit 

# get the target's label
echo "Getting the device's label..."
label=$(lsblk -o label /dev/$1 | awk 'END {print $N}')

# get the target's UUID if it does not have a label
[ -z "$label" ] && echo "Device does not have a label. Fetching UUID instead..." && label=$(lsblk -o uuid /dev/$1 | awk 'END {print $N}')

# check if the mount directory exists
echo "Preparing mounting directory..."
if [ -d "/mnt/$label" ]; then
	# if it exists, check if any other drive is mounted there
	lsblk -o mountpoint | grep "/mnt/$label" && echo "Another device is already mounted at \"/mnt/$label\"" && exit
else
	# create the directory
	sudo mkdir "/mnt/$label" || exit
fi

# mount the device
echo "Mounting the device..."
sudo mount "/dev/$1" "/mnt/$label" || exit

# set the ownership
echo "Setting ownership of directory..."
sudo chown $(users):$(users) "/mnt/$label" || exit

# notify success
info=( $(df -h --output=used,size,pcent "/mnt/$label" | awk 'END {print $N}') )
notify-send "Mounted \"$label\"" "${info[0]} used out of ${info[1]} (${info[2]})\nMounted on /mnt/$label"

# open file browser
ranger "/mnt/$label"
