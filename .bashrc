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
export BROWSER=/usr/bin/librewolf
export BOOKMARKS=$HOME/.bmks/

# Sets the alias for the home directory (for tracking dotfiles)
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Programs and utilities
alias ls='ls --color=auto'
alias torrent='pidof transmission-daemon || transmission daemon ; tremc'
alias netwatch='$SCRIPTS/internet-watchdog.sh'
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
alias nth='$SCRIPTS/new-terminal.sh'
alias mkv2mp4='$SCRIPTS/convert-mkv-to-mp4.sh'
alias mtp='$SCRIPTS/dmenu-android-mounting.sh'
alias autodock='$SCRIPTS/dock-on-startup.sh'
alias dock='$SCRIPTS/dock.sh'
alias undock='$SCRIPTS/dock.sh undock'
alias favorites='$SCRIPTS/dmenu-shared-drive.sh'
alias lock='$SCRIPTS/i3lock.sh'
alias zzz='$SCRIPTS/i3lock.sh & sleep 1 && sudo zzz'
alias die='sudo poweroff'
alias reboot='sudo reboot'
alias bmks='$HOME/.bmks/bmks'
alias qr='$SCRIPTS/scrot-zbarimg.sh'

# Frequent files/documents
alias sched='sxiv $HOME/sched.png'
alias lazy='less $HOME/notes/lazyman.md'
alias tpup='vim $HOME/notes/thinkpad-upgrade-notes.md'
alias spend='libreoffice $HOME/documents/household-expenses.ods & disown'

# Surf aliases
alias discord='chromium https://discord.com/app & disown'
alias messenger='chromium https://messenger.com/ & disown'

# Arduino shortcuts (temporary)
alias avrscr='cd $HOME/dev/arduino-scratch'
alias run='$SCRIPTS/arduino-compile-and-run.sh'
alias compile='arduino-cli compile -b arduino:avr:nano:cpu=atmega328old'
alias upload='arduino-cli compile -b arduino:avr:nano:cpu=atmega328old && arduino-cli upload -b arduino:avr:nano:cpu=atmega328old -v -p $1'
