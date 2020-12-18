# !/bin/sh
# Kills unnecessary processes and sets the status bar into a minimal state

kill $(pidof picom)
kill $(pidof transmission-daemon)
xbacklight -set 1

configdir=~/.config/i3blocks/
cat $configdir/config > $configdir/config-original
cat $configdir/config-minimal > $configdir/config
