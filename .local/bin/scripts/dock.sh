# !/bin/sh
# Script for setting the screen layout when docking/undocking

WALLPAPER=$HOME/.wallpaper
LAYOUTS=$HOME/.screenlayout

_notify_success() {
	notify-send "Screen layout applied" "Set screen layout to \"$layout\"."
}

_notify_error() {
	notify-send -u critical "Error setting screen layout" "Unable to set screen layout to\"$layout\"."
}

_all_off() {
	$LAYOUTS/nothing.sh
}

_is_undocked() {
	active_monitors=$(xrandr --listactivemonitors | sed '/Monitors/d')
	[ "$(wc -l <<< $active_monitors)" -gt 1 ] && return 1
	grep "LVDS1" <<< $active_monitors && return 0
	return 1
}

# Internal screen only
_internal() {
	layout="internal"
	$LAYOUTS/single-internal.sh && \
	_notify_success || _notify_error
}

# External monitor only
_single() {
	layout="single"
	$LAYOUTS/single-external.sh && \
	_notify_success || _notify_error
}

# Dual monitors
_dual_internal() {
	layout="dual-i"
	$LAYOUTS/dual-internal.sh && \
	_notify_success || _notify_error
}

_dual_external() {
	_single
	layout="dual-e"
	$LAYOUTS/dual-external.sh && \
	_notify_success || _notify_error
}

# Automatically chooses the default layout if no parameters were specified
_auto() {
	if xrandr | grep "HDMI2 connected"; then
		layout="dual-e"
		_dual_external
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
		feh --bg-fill $WALLPAPER
	done || \
	notify-send -u critical "Error setting wallpaper" "File \"$WALLPAPER\" is not a valid image."
}

# If no parameters set, try to automatically set the layout
[ -z "$1" ] && _auto && exit 0

input=${1,,} # Make the input lowercase
case $input in
	"dual")
		if [ "$2" == "external" ]; then
			_dual_external
		elif [ "$2" == "internal" ]; then
			_dual_internal
		fi
		;;
	"single") _single ;;
	"undock") _internal ;;
	"internal") _internal ;;
	*) notify-send -u critical "Invalid layout" "Specified layout \"$input\" does not exist." ;;
esac && _set_wallpaper
