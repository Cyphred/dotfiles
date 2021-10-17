# !/bin/sh
# Gets the qr code of the selected image

image=$(scrot -s -e "echo \$n") || exit 1
zbarimg -q $image || echo "zbarimg did not detect a readable QR code."
