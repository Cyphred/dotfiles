# !/bin/sh
# Toggles wifi between monitor and managed mode

wifiDevice="wlp4s0"
mode=$(iwconfig | grep $wifiDevice | grep "Monitor")

monitorMode() {
	sudo ip link set dev $wifiDevice down
	sudo iwconfig $wifiDevice mode monitor
}

managedMode() {
	sudo iwconfig $wifiDevice mode managed
	sudo ip link set dev $wifiDevice up
}

if [ -z "$mode" ]; then
	printf "Wireless adapter is in Managed mode. Switch to Monitor mode? (yN): "
	read input
	[ "$input" == "y" ] && monitorMode
else
	printf "Wireless adapter is in Monitor mode. Switch to Managed mode? (yN): "
	read input
	[ "$input" == "y" ] && managedMode
fi
