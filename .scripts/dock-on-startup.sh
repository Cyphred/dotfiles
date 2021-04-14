# !/bin/sh
# Checks if the ThinkPad is docked, and sets the screen layout accordingly.
# Only applicable for a single external monitor setup with the thinkpad on the right side.
# Change the target .screenlayout script when necessary.

xrandr | grep "HDMI1 connected" && $SCRIPTS/dock.sh 
