# !/bin/sh
# Run this when your internet connection is acting shitty
# This will notify you when the internet comes back on

# The interval for checking in seconds
interval=30

# The address that will be pinged to check for internet
addr="8.8.8.8"

notify-send "Internet Watchdog started" "You will be notified when your internet has been restored."

while true; do
	# Check if a single ping receives a response
	ping -c 1 $addr && break
	sleep $interval
done

notify-send -u critical "You are back online" "A response from $addr has been received."
# Play sounds to catch your attention
[ ! -z "$1" ] && mpv $1
