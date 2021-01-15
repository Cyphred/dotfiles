#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Activates vi mode with <Escape>:
set -o vi

# export PS1="[\[\e[0;93m\]\u\[\e[0m\]@\[\e[0;91m\]\h\[\e[0;94m\] \W\]\e[0m\]] \$ "
export PS1="\e[1m[\[\e[1;33m\]\u\[\e[1;0m\]\e[1;34m@\[\e[1;31m\]\h\[\e[1;32m\] \W\]\e[0m\]\e[1m] \e[0m\$ "
# PS1='[\u@\h \W]\$ '
export EDITOR=/usr/bin/vim
export TERMINAL=/usr/local/bin/st
export CUSTOMSCRIPTS=~/my-dotfiles/
export WALLPAPER=~/.wallpaper
export SCRIPTS=~/.scripts/
export SCREENSHOTS=~/Pictures/Screenshots/
export SCREENLAYOUT=~/.screenlayout/

# Sets the alias for the home directory (for tracking dotfiles)
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias ls='ls --color=auto'
alias sx='cd ~/ && startx'
alias ckb='setxkbmap us -variant colemak'
alias shs='cd $CUSTOMSCRIPTS'
alias torrent='pidof transmission-daemon || transmission daemon ; tremc'
alias setbg='feh --bg-fill ~/.wallpaper'
alias netwatch='$SCRIPTS/internet-watchdog.sh'
alias powersaver='$SCRIPTS/powersaver-mode.sh'
alias battlog='$SCRIPTS/log-battery-stats.sh'
alias killwin='$SCRIPTS/kill-on-click.sh'
alias ytm4a='$SCRIPTS/dl-m4a.sh'
alias ytmp3='$SCRIPTS/dl-mp3.sh'
alias ss='$SCRIPTS/webcam-snapshot.sh'
alias bm='bashmount'
alias lofi='$SCRIPTS/lofi.sh'
alias conf='$SCRIPTS/config-edit-menu.sh'
