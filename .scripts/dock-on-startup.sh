# !/bin/sh
# Checks if the ThinkPad is docked, and sets the screen layout accordingly.
# Only applicable for a single external monitor setup with the thinkpad on the right side.
# Change the target .screenlayout script when necessary.

output=$(xrandr | grep DP2-2)
[ -z "$output" ] && exit
printf "$output" | grep disconnected && exit

sleep 1
$SCREENLAYOUT/dual-dock-h.sh
