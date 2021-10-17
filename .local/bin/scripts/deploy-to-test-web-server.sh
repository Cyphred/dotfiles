# !/bin/sh
# Quickly copy all the contents of a directory to /srv/http/
if [ -z "$1" ]; then
	echo "Please specify a directory to copy into /srv/http/"
	exit 1
elif [ ! -d "$1" ]; then
	echo "\"$1\" is not a valid directory."
	exit 1
fi

sudo rsync -avu --exclude=deploy.sh --delete $1 /srv/http/
