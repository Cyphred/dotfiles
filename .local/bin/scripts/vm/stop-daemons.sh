# !/bin/sh
# Starts the necessary daemons for running virtual machines with virt-manager

[ "$EUID" -ne 0 ] && echo Missing root privileges. && exit 1

echo Stopping libvirtd and virtlogd...

sv stop libvirtd
sv stop virtlogd

if [ -d "/run/runit/service/libvirtd" ]; then
	rm /run/runit/service/libvirtd
fi
if [ -d "/run/runit/service/virtlogd" ]; then
	rm /run/runit/service/virtlogd
fi

sleep 1
sv status libvirtd
sv status virtlogd
