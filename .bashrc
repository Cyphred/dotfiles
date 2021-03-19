#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Activates vi mode with <Escape>:
set -o vi

PS1='\[\e[1m\][\[\e[1;33m\]\u\[\e[1;34m\]@\[\e[1;31m\]\h \[\e[1;32m\]\W\[\e[1;37m\]] \$\[\e[0m\] '
# PS1='[\u@\h \W]\$ '

# Disables highlights for directories owned by root
export LS_COLORS=$LS_COLORS:'ow=1;34:';

export EDITOR=/usr/bin/vim
export TERMINAL=/usr/local/bin/st
export WALLPAPER=~/.wallpaper
export SCRIPTS=~/.scripts/
export SCREENSHOTS=~/Pictures/Screenshots/
export SCREENLAYOUT=~/.screenlayout/
export BROWSER=/usr/bin/librewolf
export BROWSER_SECONDARY=/usr/bin/chromium

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
alias shs='$SCRIPTS/script-menu.sh'
alias deploy='$SCRIPTS/deploy-to-test-web-server.sh'
alias laravel='$HOME/.config/composer/vendor/bin/laravel'
alias sched='sxiv $HOME/sched.png'
alias nth='$SCRIPTS/new-terminal.sh'
alias mkv2mp4='$SCRIPTS/convert-mkv-to-mp4.sh'
alias mtp='$SCRIPTS/dmenu-android-mounting.sh'
alias autodock='$SCRIPTS/dock-on-startup.sh'
alias dock='$SCREENLAYOUT/dual-dock-h.sh'
alias undock='$SCREENLAYOUT/undock.sh'
alias favorites='$SCRIPTS/dmenu-shared-drive.sh'
alias lock='$SCRIPTS/i3lock.sh'
alias zzz='$SCRIPTS/i3lock.sh & systemctl suspend'
alias die='systemctl poweroff'
alias bmks='$HOME/.bmks/bmks'

# Arduino shortcuts (temporary)
alias compile='arduino-cli compile -b arduino:avr:nano:cpu=atmega328old'
alias upload='arduino-cli upload -b arduino:avr:nano:cpu=atmega328old -v -p $1'

