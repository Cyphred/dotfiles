# !/bin/sh
# Dmenu removable media manager

echo "==========================="
echo "  Removable Media Manager"
echo "==========================="

# ask for the operation to be performed
input=$(printf "mount\nunmount" | dmenu)

case $input in
	"mount")
		operation=0
		# fetch all devices that are not mounted
		drives=$(lsblk -o name,label,size,mountpoint | grep -v sda | grep ─ | grep -v / | sed "s/└─//g" | sed "s/├─//g") 
		[ -z "$drives" ] && notify-send "No external storage found" "Could not find any external storage to mount." && exit
		;;

	"unmount")
		operation=1
		# fetch all mounted devices
		drives=$(lsblk -o name,label,size,mountpoint | grep -v sda | grep ─ | grep / | sed "s/└─//g" | sed "s/├─//g") 
		[ -z "$drives" ] && notify-send "No external storage found" "Could not find any external storage to unmount." && exit
		;;
esac


# extract the name of the device
target=$(printf "$drives" | dmenu -l 5 | awk '{print $1}')

case $operation in
	0) $SCRIPTS/mount-removable-media.sh $target ;;
	1) $SCRIPTS/unmount-removable-media.sh $target ;;
esac
