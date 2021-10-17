# !/bin/sh

kill $(pidof picom)
kill $(pidof transmission-daemon)
cat ~/.config/i3blocks/config-minimal > ~/.config/i3blocks/config
xbacklight -set 1
