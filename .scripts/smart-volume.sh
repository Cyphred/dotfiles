# !/bin/sh
# 

volmod=$(($(pamixer --get-volume)%5))
refresh() {
	pkill -RTMIN+10 i3blocks
}

case $1 in
	"u") pactl set-sink-volume @DEFAULT_SINK@ +5% ;;
	"su") pactl set-sink-volume @DEFAULT_SINK@ +10% ;;
	"csu") pactl set-sink-volume @DEFAULT_SINK@ +1% ;;
	"d") pactl set-sink-volume @DEFAULT_SINK@ -5% ;;
	"sd") pactl set-sink-volume @DEFAULT_SINK@ -10% ;;
	"csd") pactl set-sink-volume @DEFAULT_SINK@ -1% ;;
esac

