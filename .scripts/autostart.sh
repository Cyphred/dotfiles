# !/bin/sh
# Auto start script

# Dock
xrandr | grep "HDMI1 connected" && $SCRIPTS/dock.sh dual

# Start transmission
pidof transmission-daemon || transmission-daemon &
