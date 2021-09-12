# !/bin/sh
# Extracts a burnable image from an ISO

isoinfo -i $1 -d | grep Bootoff
echo "The decimal is the start of the bootable disk image."
$boot_sector=27

dd if=$1 of=output.img skip=$boot_sector
