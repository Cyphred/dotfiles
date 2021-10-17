# !/bin/sh
# Scrot with Notifier
# Takes a screenshot and sends a notification confirming the action
# Jeremy Andrews Zantua | jeremyzantua@gmail.com

datefname=$(date "+%Y-%m-%d-%H-%M-%S-%N")
scrot $1 "$datefname"_$wx$h-scrot.png -e 'mv $f $SCREENSHOTS ; notify-send "Screenshot taken" "Saved as $f"'
