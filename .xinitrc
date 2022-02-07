#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Set the keymap to colemak when starting X
setxkbmap us -variant colemak

# Start the compositor
# picom -b --unredir-if-possible --backend xr_glx_hybrid --vsync --use-damage --glx-no-stencil &
#picom -b --unredir-if-possible --backend xr_glx_hybrid --vsync --vsync-use-glfinish --use-damage --glx-no-stencil &
picom --vsync & 

# Set the wallpaper
feh --bg-fill ~/.wallpaper &

# For Java applications to work, mainly JetBrains IDEs
export _JAVA_AWT_WM_NONREPARENTING=1

# For Java applications to work, mainly JetBrains IDEs
#export AWT_TOOLKIT=MToolkit
export _JAVA_AWT_WM_NONREPARENTING=1

## Start dwm
#exec dwm
exec i3
