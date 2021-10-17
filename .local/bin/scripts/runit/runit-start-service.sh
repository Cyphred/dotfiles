# !/bin/sh

[ "$EUID" -ne 0 ] && echo Missing root privileges. && exit 1
[ -z "$1" ] && echo Please provide a service name. && exit 1

SV="/etc/runit/sv/$1"
DEST="/run/runit/service/$1"

# Verify service with same name exists
[ ! -d "$SV" ] && echo Could not find service \'$1\'. && exit 1

# Check if service isn't already in /run/runit/service/ directory
[ -d "$DEST" ] && echo \'$1\' already exists in /run/runit/service/. && exit 1

ln -s $SV $DEST
sleep 1
sv status $1
