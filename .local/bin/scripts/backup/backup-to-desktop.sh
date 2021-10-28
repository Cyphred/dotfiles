# !/bin/sh
# Uses rsync to back up necessary folders to desktop.

if [ -z "$1" ]; then
	echo "Please specify an IP address for the desktop."
	exit 1
fi

echo "Checking if $1 is online..."
if ! ping -c 1 $1; then
	echo "No response received from $1."
	echo "Is the desktop on and connected to the network?"
	echo "Aborting..."
	exit 1
fi

# So current session only asks for SSH passphrase once.
eval $(ssh-agent)
ssh-add

exists()
{
	if [ -d "$1" ]; then
		return 0
	else
		return 1
	fi
}

# Anime
rsync -avur /mnt/hdd1/torrents/anime/ $1:/mnt/disk1/entertainment/anime

# Music folder
# Copies symlinks as their referenced files/folders.
rsync -avurL /mnt/hdd1/music/ $1:/mnt/disk1/entertainment/music

# cmus playlists
rsync -avu /home/cyphred/.config/cmus/playlists $1:/home/cyphred/.config/cmus/playlists

# Photos
rsync -avur /mnt/hdd1/photos/ $1:/mnt/disk1/photos

# Videos
rsync -avur /mnt/hdd1/videos/ $1:/mnt/disk1/videos

# Documents
rsync -avur /home/cyphred/documents/ $1:/mnt/disk1/documents

# Books
rsync -avur /home/cyphred/books/ $1:/mnt/disk1/books

# Notes
#rsync -avur /home/cyphred/notes/ $1:/mnt/disk1/notes
