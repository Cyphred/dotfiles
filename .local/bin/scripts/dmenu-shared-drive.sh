# !/bin/sh
# A simple menu for opening my shared drive's folders

folders=( books dev documents downloads notes picutres school torrents )
data_dir="$HOME"

input=$(echo "${folders[@]}" | sed 's/\ /\n/g' | dmenu)

if [ -z "$input" ]; then
	exit 1
elif [ "$input" == "school" ]; then
	$SCRIPTS/dmenu-school-folder.sh

elif [ -d "$data_dir/$input" ]; then
	$TERMINAL -e ranger $data_dir/$input
else
	notify-send "Directory \"$input\" not found"
fi
