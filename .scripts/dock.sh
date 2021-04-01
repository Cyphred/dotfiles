# !/bin/sh
# Script for setting the screen layout when docking/undocking

wallpaper=$HOME/.wallpaper

_notify_success() {
	notify-send "Screen layout applied" "Set screen layout to \"$layout\"."
}

_notify_error() {
	notify-send -u critical "Error setting screen layout" "Unable to set screen layout to\"$layout\"."
}

# Internal screen only
_internal() {
	layout="internal"
	xrandr --output LVDS1 --mode 1366x768 --pos 0x0 --rotate normal --output DP1 --off --output DP2 --off --output DP3 --off --output HDMI1 --off --output HDMI2 --off --output HDMI3 --off --output VGA1 --off --output VIRTUAL1 --off
	_notify_success || _notify_error
}

# External monitor only
_single() {
	layout="single"
	xrandr --output LVDS1 --off --output DP1 --off --output DP2 --off --output DP3 --off --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI2 --off --output HDMI3 --off --output VGA1 --off --output VIRTUAL1 --off && \
	_notify_success || _notify_error
}

# Dual monitors
_dual() {
	layout="dual"
	xrandr --output LVDS1 --mode 1366x768 --pos 1920x421 --rotate normal --output DP1 --off --output DP2 --off --output DP3 --off --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI2 --off --output HDMI3 --off --output VGA1 --off --output VIRTUAL1 --off
	_notify_success || _notify_error
}

# Automatically chooses the default layout if no parameters were specified
_auto() {
	if xrandr | grep "HDMI1 connected"; then
		layout="dual"
		_dual
	else
		layout="internal"
		_internal
	fi && \
	_set_wallpaper
}

_set_wallpaper() {
	# If no arguments passed, assume there is only 1 monitor
	[ -z "$1" ] && num=1 || num=$1

	for i in $(eval echo {1..$num})
	do
		feh --bg-fill $wallpaper
	done || \
	notify-send -u critical "Error setting wallpaper" "File \"$wallpaper\" is not a valid image."
}

# If no parameters set, try to automatically set the layout
[ -z "$1" ] && _auto && exit 0

input=${1,,} # Make the input lowercase
case $input in
	"dual") _dual ;;
	"single") _single ;;
	"undock") _internal ;;
	"internal") _internal ;;
	*) notify-send -u critical "Invalid layout" "Specified layout \"$input\" does not exist." ;;
esac && _set_wallpaper
