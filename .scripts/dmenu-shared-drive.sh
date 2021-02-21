# !/bin/sh
# A simple menu for opening my shared drive's folders

folders=( books dev documents downloads notes picutres school torrents )
data_dir=/run/media/cyphred/Shared
input=$(echo "${folders[@]}" | sed 's/\ /\n/g' | dmenu)

[ -z "$input" ] && exit
[ -d "$data_dir/$input" ] && $TERMINAL -e ranger $data_dir/$input || notify-send "Directory \"$input\" not found"
