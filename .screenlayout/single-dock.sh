#!/bin/sh
xrandr --output eDP1 --off --output DP2-2 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP2-1 --off --output DP2-3 --off
feh --bg-fill ~/.wallpaper --bg-fill ~/.wallpaper
notify-send 'Screen layout changed' 'Set screen layout to Single mode'
