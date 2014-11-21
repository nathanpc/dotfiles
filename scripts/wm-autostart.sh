#!/bin/sh

# Merge X configs.
xrdb -merge ~/.Xresources &

# Wallpaper
nitrogen --restore &

# Window Composition
xcompmgr -f -D 5 &

# Awesome systray
#tint2 &
#lxpanel &

# Conky
conky &

# Disable X screensaver/blanking.
xset -dpms &
xset s noblank &
xset s off &

# Disable Nautilus desktop.
gconftool-2 -s -t bool /apps/nautilus/preferences/show_desktop false &

# Do not let Nautilus set the background image.
gconftool-2 -s -t bool /desktop/gnome/background/draw_background false &

# Make Nautilus use spatial mode, should start-up quicker.
gconftool-2 -s -t bool /apps/nautilus/preferences/always_use_browser false &

# Make Nautilus show the advanced permissions dialog 
gconftool-2 -s -t bool /apps/nautilus/preferences/show_advanced_permissions true &
