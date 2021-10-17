# !/bin/sh
# Time the charging of the emergency lights
notify-send "Emergency Light A Charging" "You will be notified to switch the charging emergency light in an hour."
sleep 3600
notify-send -u critical "Emergency Light A Charging Complete" "Plug in Emergency Light B"
echo "Waiting for Emergency Light B to be plugged in. Press enter once done."
read kek
notify-send "Emergency Light B Charging" "You will be notified to unplug the charging emergency light in an hour."
sleep 3600
notify-send -u critical "Emergency Light B Charging Complete" "Unplug Emergency Light B"
