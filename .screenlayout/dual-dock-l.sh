#!/bin/sh
xrandr --output eDP1 --off --output DP2-2 --primary --mode 1920x1080 --pos 900x418 --rotate normal --output DP2-1 --mode 1600x900 --pos 0x0 --rotate right --output DP2-3 --off &&
	feh --bg-fill ~/.wallpaper --bg-fill ~/.wallpaper &&
	notify-send -u low 'Screen layout changed' 'Set screen layout to Dual, L mode'||
	notify-send -u critical 'Screen layout unchanged' 'Could not set current screen layout'
