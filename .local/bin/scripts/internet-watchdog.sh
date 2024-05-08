# !/bin/sh
# Run this when your internet connection is acting shitty
# This will notify you when the internet comes back on

[ -z "$1" ] && echo "Please specify an interface." && exit 1
if ! ip a | grep $1; then
	echo "Inerface $1 does not exist."
	exit 1
fi
interface=$1

# The interval for checking in seconds
interval=30

# The address that will be pinged to check for internet
#addr="1.1.1.1"
addr="google.com"

notify-send "Internet Watchdog started" "You will be notified when your internet has been restored."

while true; do
	# Check if a single ping receives a response
	ping -c 1 $addr -I $interface && break
	sleep $interval
done

notify-send -u critical "You are back online" "A response from $addr has been received."
