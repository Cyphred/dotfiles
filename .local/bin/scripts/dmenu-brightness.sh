# !/bin/sh
# Dmenu Brightness Control

case $1 in
	a)
		input=$(printf "1\n25\n50\n75\n100" | dmenu)
		;;
	d)
		input=$(printf "100\n75\n50\n25\n1" | dmenu)
		;;
	*)
		exit
		;;
esac
[ -z "$input" ] && exit
[[ "$input" -gt "0" ]] && [[ "$input" -lt "101" ]] || exit
xbacklight -set $input
