# !/bin/sh
# Colemak Layout Switch
# Switches between colemak and qwerty layouts
# Jeremy Andrews Zantua | jeremyzantua@gmail.com

qwerty () {
	setxkbmap us
	notify-send 'Keymap Set' 'Changed the keymap to QWERTY'
}

colemak () {
	setxkbmap us -variant colemak
	notify-send 'Keymap Set' 'Changed the keymap to Colemak'
}

setxkbmap -query | grep colemak && qwerty && exit
colemak
