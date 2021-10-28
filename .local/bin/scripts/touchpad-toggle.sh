# !/bin/sh
# Toggles touchpad on/off
# Note: Only tested with Thinkpads.

touchpadOn() {
	synclient TouchpadOff=0
	notify-send "Touchpad ON"
}

touchpadOff() {
	synclient TouchpadOff=1
	notify-send "Touchpad OFF"
}

(synclient | grep 'TouchpadOff.*1' && touchpadOn) || touchpadOff
