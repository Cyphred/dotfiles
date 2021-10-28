# !/bin/sh
# Turns on bluetooth

[ "$EUID" -ne 0 ] && echo Missing root privileges. && exit 1

if ! sv status bluetoothd; then
	
