# !/bin/sh
# Rotate Display
# Changes the orientation of the selected display

check () {
	case $1 in
		normal) orientation=normal ;;
		left) orientation=left ;;
		right) orientation=right ;;
		inverted) orientation=inverted ;;
		*)
			notify-send -u critical 'Display Rotation' "\'$1\' is not a valid orientation."
			exit
			;;
	esac
}

if [ "$1" == "primary" ]; then
	# Get the primary output
	target=$(xrandr | grep primary | awk '{print $1}')

	# If there is no primary monitor set
	[ -z "$target" ] && notify-send -u critical 'Display Rotation' 'No primary monitor set.' && exit
	check $2
else
	target=$1
	xrandr | grep $1 || notify-send -u critical 'Display Rotation' "\'$target\' is not a valid output." && exit
	check $2
fi

# Set the orientation
xrandr --output $target --rotate $orientation &&
	notify-send -u low 'Display Rotation' "Set \'$target\' rotation to $orientation." ||
	notify-send -u critical 'Display Rotation' "Could not set the rotation for \'$target\'."
