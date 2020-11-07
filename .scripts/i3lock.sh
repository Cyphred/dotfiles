# !/bin/sh
# i3lock
# Custom locking script

# Do not launch if i3lock is already running
pidof i3lock && exit

# Lock the screen
i3lock -efti $HOME/.config/i3lock/lockbg.png &

# Wait for 10 seconds and turn off display if still locked
sleep 10 && pidof i3lock && xset s activate
