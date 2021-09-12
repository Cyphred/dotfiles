# !/bin/sh
# Checks if there is a halt order before powering off

halt_file=$SCRIPTS/power-control/halt

if [ -f "$halt_file" ]; then
	printf "[[ HALT ORDER ACTIVE ]]\nA halt order is currently active.\nPlease resolve it before powering down the system.\nThe halt message is as follows:\n\n"
	cat $halt_file
else
	loginctl poweroff
fi
