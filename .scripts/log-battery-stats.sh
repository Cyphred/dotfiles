# !/bin/sh
# Log the stats of your laptop's battery using TLP
logfile="$HOME/.batterylog"
touch "$logfile"

# Grabs the energy_full value
level=$(sudo tlp-stat -b | grep energy_full | grep -v design | awk 'END {print $(NF-1)}')

[ -z "$level" ] && exit

output=$(date +%Y-%m-%d-%H-%M-%S)
output+="\t$level\n"
printf "$output" >> $logfile
echo "Logged battery stats: $level mWh"
