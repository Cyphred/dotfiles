# !/bin/sh
# Run this when your internet connection is acting shitty
# This will notify you when the internet comes back on

# The interval for checking in seconds
interval=30

# The address that will be pinged to check for internet
addr="8.8.8.8"

# Interface names
wireless_interface="wlp4s0"
ethernet_interface="enp0s25"

# Ask what interface to use
printf "What interface do you want to ping?\n1) ethernet\t2)wi-fi\n(default=1) "
read interface
[ -z "$interface" ] && interface=1
case "$interface" in
	"1") interface=$ethernet_interface ;;
	"2") interface=$wireless_interface ;;
	*) exit 1 ;;
esac

notify-send "Internet Watchdog started" "You will be notified when your internet has been restored."

while true; do
	# Check if a single ping receives a response
	ping -c 1 $addr -I $interface && break
	sleep $interval
done

notify-send -u critical "You are back online" "A response from $addr has been received."
# Play sounds to catch your attention
[ ! -z "$1" ] && mpv $1
