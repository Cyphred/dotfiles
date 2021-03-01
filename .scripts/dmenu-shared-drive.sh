# !/bin/sh
# A simple menu for opening my shared drive's folders

folders=( books dev documents downloads notes picutres school torrents )
data_dir="/run/media/cyphred/Shared"

input=$(echo "${folders[@]}" | sed 's/\ /\n/g' | dmenu)

if [ -z "$input" ]; then
	exit 1
elif [ "$input" == "school" ]; then
	school_dirs=( $(ls -d $data_dir/school/*/) )
	school_dirs=( "${school_dirs[@]#"$data_dir"/school/}" )
	school_dirs=( "${school_dirs[@]%/}" )
	option=$(printf '%s\n' "${school_dirs[@]}" | dmenu -l 20)
	$TERMINAL -e ranger $data_dir/school/$option

elif [ -d "$data_dir/$input" ]; then
	$TERMINAL -e ranger $data_dir/$input
else
	notify-send "Directory \"$input\" not found"
fi
