#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -d $HOME/.config/composer/vendor/bin ]] && export PATH=$HOME/.config/composer/vendor/bin:$PATH

# Activates vi mode with <Escape>:
set -o vi

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

export EDITOR=/usr/bin/nvim
export TERMINAL=/usr/bin/kitty
export WALLPAPER=~/.wallpaper
export SCRIPTS=~/.local/bin/scripts
export SCREENSHOTS=~/Pictures/Screenshots/
export BROWSER=/usr/bin/firefox
export BROWSER_PRIVATE="$BROWSER --private-window"
export BROWSER_SECONDARY=/usr/bin/librewolf
export BOOKMARKS=$HOME/.bmks/
export ETHERNET="enp3s0"
export FILEMANAGER=/usr/bin/pcmanfm
export WIFI=""
export SCREENLAYOUT=$HOME/.screenlayout

# Sets the alias for the home directory (for tracking dotfiles)
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Programs and utilities
alias ls='ls --color=auto'
alias dmenu='dmenu -nb "#eae1c0" -nf "#686966" -sb "#859900" -sf "#eee8d5"'
alias killwin='$SCRIPTS/kill-on-click.sh'
alias ytm4a='$SCRIPTS/dl-m4a.sh'
alias ytmp3='$SCRIPTS/dl-mp3.sh'
alias ss='$SCRIPTS/webcam-snapshot.sh'
alias bm='bashmount'
alias conf='$SCRIPTS/config-edit-menu.sh'
alias nth='$SCRIPTS/new-terminal.sh'
alias mkv2mp4='$SCRIPTS/convert-mkv-to-mp4.sh'
alias autodock='$SCRIPTS/dock-on-startup.sh'
alias bmks='$HOME/.bmks/bmks'
alias qr='$SCRIPTS/scrot-zbarimg.sh'
alias scim='sc-im'
alias httpsrv='python -m http.server'
alias wp='feh --bg-fill ~/.wallpaper --bg-fill ~/.wallpaper'
alias disk='$HOME/.local/bin/scripts/disk.sh'
alias vim='/usr/bin/nvim'
alias nodedev='source /usr/share/nvm/init-nvm.sh'
alias fz='$SCRIPTS/rxvt-fontsize.sh'
alias mirror='$SCRIPTS/webcam-mirror.sh'
alias ppt2pdf='soffice --headless --convert-to pdf $1'
alias cmus='cmus colorscheme dracula'
alias kitty-ssh='kitty +kitten ssh'
alias alarm='python $HOME/.local/bin/scripts/alarm.py'

# Docking shortcuts
alias dock='$SCRIPTS/dock.sh'
alias undock='$HOME/.screenlayout/single-internal.sh && feh --bg-fill ~/.wallpaper --bg-fill ~/.wallpaper'

# Internet needed
alias weather='$SCRIPTS/weather.sh'

# Power aliases
alias lock='$SCRIPTS/i3lock.sh & xset dpms force off'
alias off='xset dpms force off'
alias zzz='$SCRIPTS/i3lock.sh & sleep 1 && systemctl suspend'
alias ZZZ='$SCRIPTS/i3lock.sh & sleep 1 && systemctl hibernate || kill $(pidof i3lock)'
alias die='mpv $HOME/.config/i3/xp-shutdown.mp3 && systemctl poweroff'
alias reboot='mpv $HOME/.config/i3/xp-shutdown.mp3 && systemctl reboot'

# Screen temperature
alias piss='redshift -PO 4000'
alias unpiss='redshift -x'
alias red='redshift -PO 1000'

# Frequent files/documents
alias sched='sxiv $HOME/.sched'
alias lazy='less $HOME/notes/lazyman.md'
alias giveup='mpv $HOME/videos/never-give-up.mkv & disown'
alias jr='$HOME/journal/new-entry.sh'
alias finances='libreoffice $HOME/documents/finances.ods'

# Arduino shortcuts (temporary)
# TODO create proper arduino compile scripts
alias run='$SCRIPTS/arduino/arduino-compile-and-run.sh'
# alias compile='arduino-cli compile -b arduino:avr:nano:cpu=atmega328old'
# alias upload='arduino-cli compile -b arduino:avr:nano:cpu=atmega328old && arduino-cli upload -b arduino:avr:nano:cpu=atmega328old -v -p $1'
 alias compile='arduino-cli compile -b arduino:avr:uno'
 alias upload='arduino-cli compile -b arduino:avr:uno && arduino-cli upload -b arduino:avr:uno -v -p $1'

# Website shortcuts

# I use Brave cos it's usually the only Chromium browser I have.
# Maybe when Microsoft decides to fix their support for the native linux app,
# then I'll remove this.
alias teams='brave https://teams.live.com/'

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export ANDROID_HOME=/opt/android-sdk

export PATH=$PATH:$JAVA_HOME/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

