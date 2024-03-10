# !/bin/sh
# Colemak Layout Switch
# Switches between colemak and qwerty layouts
# Jeremy Andrews Zantua | jeremyzantua@gmail.com

qwerty () {
	setxkbmap us
	dunstify -h string:x-dunst-stack-tag:keymap \
		--icon=/usr/share/icons/Chicago95/devices/32/keyboard.png \
		'QWERTY Mode' 'Changed the keymap to QWERTY'
}

colemak () {
	setxkbmap us -variant colemak
	dunstify -h string:x-dunst-stack-tag:keymap \
		--icon=/usr/share/icons/Chicago95/devices/32/keyboard.png \
		'Colemak Mode' 'Changed the keymap to Colemak'
}

# Check if variant is currently colemak
# Switch to qwerty if true
setxkbmap -query | grep 'variant:[[:space:]]*colemak' && qwerty && exit

# If above condition fails, falls back to colemak
colemak
