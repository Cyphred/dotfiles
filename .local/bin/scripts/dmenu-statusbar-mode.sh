# !/bin/sh
# Switches between statusbar modes
configdir=$HOME/.config/i3blocks
target=$(printf "full\nminimal" | dmenu)
case $target in
	"full") ln -sf "$configdir/config-full" "$configdir/config" ;;
	"minimal") ln -sf "$configdir/config-minimal" "$configdir/config" ;;
esac

