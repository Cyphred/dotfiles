# !/bin/sh
# Converts a file into webm with a specific crf value

if [ ! "$1" ]; then
	echo "Please provide an input file"
	exit 1
fi

if [ ! "$2" ]; then
	echo "Please provide an output destination"
	exit 1
fi

if [ ! "$3" ]; then
	echo "Please provide crf value (4-63, lower being higher quality)"
	exit 1
fi

ffmpeg -i $1 -vcodec libvpx -acodec libvorbix -crf $2 $3
