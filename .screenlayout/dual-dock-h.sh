#!/bin/sh
xrandr --output eDP1 --mode 1366x768 --pos 1920x312 --rotate normal --output DP2-2 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP2-1 --off --output DP2-3 --off &&
	notify-send -u low 'Screen layout changed' 'Set screen layout to Dual, Horizontal mode'&&
	feh --bg-fill ~/.wallpaper --bg-fill ~/.wallpaper ||
	notify-send -u critical 'Screen layout unchanged' 'Could not set current screen layout'
