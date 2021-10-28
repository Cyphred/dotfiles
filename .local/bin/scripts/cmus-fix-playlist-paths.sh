# !/bin/sh
# Changes cmus playlist paths to full paths
# This is for taking care of playlist entries that
# point to symbolic links.

PLAYLISTS="$HOME/.config/cmus/playlists"
HOMEDIR=$(sed "s|/|\\\/|g" <<< $HOME)

sed -i "s|$HOMEDIR|\/mnt\/hdd1" $PLAYLISTS/* && \
	echo Fixed cmus playlists' paths.
