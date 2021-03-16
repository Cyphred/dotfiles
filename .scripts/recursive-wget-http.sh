# !/bin/sh
# Recursively downloads a directory and its contents from HTTP servers
if [ -z "$1" ]; then
	echo "Please specify a URL."
	exit 1
fi
wget -r -np -R "index.html*" $1
