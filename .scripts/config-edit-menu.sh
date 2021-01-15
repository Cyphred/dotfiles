# !/bin/sh
# Simple menu for opening commonly-edited config files

options="i3config\ni3blocks\nstatus modules\nbashrc\nvimrc"
target=$(printf "$options" | dmenu)

case $target in
	"i3config") vim $HOME/.config/i3/config ;;
	"i3blocks") vim $HOME/.config/i3blocks/config ;;
	"status modules") vim $HOME/.local/bin/statusbar/ ;;
	"bashrc") vim $HOME/.bashrc ;;
	"vimrc") vim $HOME/.vimrc ;;
	"scripts") vim $SCRIPTS
esac
