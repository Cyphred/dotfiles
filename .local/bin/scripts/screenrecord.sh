_usage() {
	echo "Usage: screenrecord.sh <resolution> <output file name>\nFormat is mkv."
	exit 1
}

[ -z $1 ] && _usage
[ -z $2 ] && _usage

ffmpeg -f x11grab -r 30 -s $1 -i :0.0 -f alsa -i hw:0 $2
