# !/bin/sh
# Simple menu for opening commonly-edited config files

options="dwm\ndwmblocks\nstatus modules\nbashrc\nvimrc"
target=$(printf "$options" | dmenu)

case $target in
	"dwm")
		vim $HOME/dev/dwm-luke/config.h
		prompt_for_compile
		;;
	"dwmblocks") vim $HOME/dev/dwmblocks/config.h ;;
	"status modules") vim $HOME/.local/bin/statusbar/ ;;
	"bashrc") vim $HOME/.bashrc ;;
	"vimrc") vim $HOME/.vimrc ;;
	"scripts") vim $SCRIPTS
esac
