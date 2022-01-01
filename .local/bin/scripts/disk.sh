# !/bin/sh
# Displaying status of internal disks

get_info()
{
	location=${1:-/}
	[ -d "$location" ] || exit

	printf "%s\t%s\n" "$(df -h "$location" | awk ' /[0-9]/ {print $3 " / " $2}')" "$2" 
}

get_info / "root"
get_info /mnt/hdd0 "shared hdd"
get_info /mnt/hdd1 "media hdd"
get_info /mnt/ssd0 "media ssd"
get_info /mnt/msata0 "scratch ssd"
