#!/bin/sh
xrandr --output eDP1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output DP2-1 --off --output DP2-2 --off --output DP2-3 --off
feh --bg-fill ~/.wallpaper
notify-send -u low 'Screen layout changed' 'Set screen layout to Internal Display mode'
