# !/bin/sh
# Logs the times internet is lost and returns

_determine_quiet_mode() {
	case $1 in
		"quiet")
			quiet_mode=1
			notif_message="Quiet mode enabled: You will not be notified when internet goes up or down, but will still log these events to the generated log file."
			;;
	esac
}

_determine_address() {
	default_addr="8.8.8.8"
	[ -z "$2" ] && addr="$default_addr" || addr="$2"
}

_create_log_file() {
	log_file="$HOME/$(date '+%Y-%m-%d-%H%M%S-netwatch').log"
	echo "# Starting internet-watchdog-logger on $addr" > $log_file
}

_log_event() {
	echo "$(date '+%F %T')	$1" >> $log_file
	[ "$quiet_mode" != 1 ] && notify-send "Internet is $1"
}

# Main method
notify-send "Internet Watchdog Logger started" "$notif_message"
start_time=$(date '+%F %T')
_determine_quiet_mode $1
_determine_address $2
_create_log_file
_log_event "START"
last_status=0
while true; do
	if ping -c 1 $addr; then
		[ "$last_status" == 0 ] && _log_event "UP"
		last_status=1
	else
		[ "$last_status" == 1 ] && _log_event "DOWN"
		last_status=0
	fi
	sleep 5
done

notify-send -u critical "Internet Watchdog Logger stopped"
_log_event "STOP"
