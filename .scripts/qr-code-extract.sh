# !/bin/sh
# Extracts the link from a qr code and copies it to xclip

if [ -z "$1" ]; then
	echo "Please specify an image of a qr code."
	exit 1
fi

zbarimg -q $1 | xclip -sel clip
