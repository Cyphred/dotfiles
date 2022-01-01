# !/bin/sh
# Starts/stops virtual machine services

[ $EUID -ne 0 ] && echo Missing root privileges && exit 1

if [ "${1,,}" == "start" ]; then
elif [ "${1,,}" == "stop" ]; then
