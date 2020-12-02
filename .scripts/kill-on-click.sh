# !/bin/sh
# Click on a window to kill it

notify-send "Kill mode" "Click on a window to kill it."
kill $(xprop _NET_WM_PID | cut -d' ' -f3)
