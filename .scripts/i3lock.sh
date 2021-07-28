# !/bin/sh
# i3lock
# Custom locking script

# Do not launch if i3lock is already running
pidof i3lock && exit

# Lock the screen
i3lock -efti $HOME/.config/i3lock/lockbg.png &
sleep 1 && xset dpms force off
#i3lock -euti $HOME/.config/i3lock/lockbg.png &
