# !/bin/sh
# Backs up secrets to flash drive

[ "$EUID" -ne 0 ] && echo Missing root privileges. && exit 1

UUID="dc2e2556-d262-4bcd-bee2-b1ca8ce76d59"
CRYPTUUID="35160044-fd29-4f26-a908-44c6e34251aa"
MOUNT="/mnt/secrets"

# Check if backup USB drive is present
if [ ! -L "/dev/disk/by-uuid/$UUID" ]; then
	echo Backup drive not found.
	exit 1
fi

# Decrypt backup drive
cryptsetup luksOpen /dev/disk/by-uuid/$UUID cryptventoy

if [ ! -L "/dev/disk/by-uuid/$CRYPTUUID" ]; then
	echo Could not find decrypted backup partition.
	exit 1
fi

mkdir $MOUNT
mount /dev/disk/by-uuid/$CRYPTUUID $MOUNT || exit 1

# Backup password store
rsync -avur --delete /home/cyphred/.password-store/ /secrets/password-store

# Backup secrets folder
rsync -avur 

# Backup 

umount /dev/disk/by-uuid/$UUID
rmdir /secrets/backup
