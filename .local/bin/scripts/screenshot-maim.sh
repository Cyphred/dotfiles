# !/bin/sh

[ -z "$1" ] && echo "Please specify screenshot type (full, select, window)." && exit 1

case $1 in:
	"select")
		OPTS="--select"
		;;
	"full)
		OPTS="
		
filename="$HOME/pic-full-$(date '+%y%m%d-%H%M-%S').png"
maim $filename && notify-send "Screenshot taken" "Saved screenshot as $filename"
