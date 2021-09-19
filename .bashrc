#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Activates vi mode with <Escape>:
set -o vi

color_yellow='\[\e[1;33m]'
color_blue='\[\e[1;34m]'
color_red='\[\e[1;31m]'
color_green='\[\e[1;32m]'
color_none='\[\e[0m]'
# PS1='\[\e[1m\][\[\e[1;33m\]\u\[\e[1;34m\]@\[\e[1;31m\]\h \[\e[1;32m\]\W\[\e[1;37m\]] \$\[\e[0m\] '
# PS1='[\u@\h \W]\$ '

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="[\[\e[33m\]\u\[\e[m\]@\[\e[34m\]\h\[\e[m\] \[\e[32m\]\W\[\e[m\]]\[\e[35m\]\`parse_git_branch\`\[\e[m\]\\$ "

# Disables highlights for directories owned by root
export LS_COLORS=$LS_COLORS:'ow=1;34:';

export EDITOR=/usr/bin/vim
#export TERMINAL=/usr/local/bin/st
export TERMINAL=/usr/bin/urxvt
export WALLPAPER=~/.wallpaper
export SCRIPTS=~/.scripts/
export SCREENSHOTS=~/Pictures/Screenshots/
export BROWSER=/usr/bin/brave
export BROWSER_SECONDARY=/usr/bin/librewolf
export BOOKMARKS=$HOME/.bmks/

# Sets the alias for the home directory (for tracking dotfiles)
export WALLPAPER=~/.wallpaper
export SCRIPTS=~/.scripts/
export SCREENSHOTS=~/Pictures/Screenshots/
export BROWSER=/usr/bin/brave
export BROWSER_SECONDARY=/usr/bin/librewolf
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
alias favorites='$SCRIPTS/dmenu-shared-drive.sh'
alias bmks='$HOME/.bmks/bmks'
alias qr='$SCRIPTS/scrot-zbarimg.sh'
alias scim='sc-im'
alias httpsrv='python -m http.server'

# Docking shortcuts
alias dock='$SCRIPTS/dock.sh'
alias undock='$SCRIPTS/dock.sh undock'

# Internet needed
alias weather='$SCRIPTS/weather.sh'

# Power aliases
alias lock='$SCRIPTS/i3lock.sh'
alias off='xset dpms force off'
alias zzz='$SCRIPTS/i3lock.sh & sleep 1 && loginctl suspend'
alias ZZZ='$SCRIPTS/i3lock.sh & sleep 1 && loginctl hibernate'
alias die='$SCRIPTS/power-control/poweroff.sh'
alias reboot='loginctl reboot'

# Frequent files/documents
alias sched='sxiv $HOME/.sched'
alias lazy='less $HOME/notes/lazyman.md'
alias giveup='mpv $HOME/videos/never-give-up.mkv'
alias jr='$HOME/journal/new-entry.sh'

# Arduino shortcuts (temporary)
# TODO create proper arduino compile scripts
# alias run='$SCRIPTS/arduino-compile-and-run.sh'
# alias compile='arduino-cli compile -b arduino:avr:nano:cpu=atmega328old'
# alias upload='arduino-cli compile -b arduino:avr:nano:cpu=atmega328old && arduino-cli upload -b arduino:avr:nano:cpu=atmega328old -v -p $1'
