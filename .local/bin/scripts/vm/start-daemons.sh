# !/bin/sh
# Starts the necessary daemons for running virtual machines with virt-manager

[ "$EUID" -ne 0 ] && echo Missing root privileges. && exit 1

echo Starting libvirtd and virtlogd...

ln -s /etc/runit/sv/libvirtd /run/runit/service/libvirtd
ln -s /etc/runit/sv/virtlogd /run/runit/service/virtlogd
sleep 3
sv status libvirtd
sv status virtlogd
