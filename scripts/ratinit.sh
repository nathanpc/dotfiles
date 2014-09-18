#!/bin/sh

(sleep 1; \
	# Update the X resources database.
	xrdb -merge ~/.Xresources &

	# Setup the touchpad.
	synclient TapButton1=1 &
	synclient &

	# Wallpaper.
	nitrogen --restore &

	# Window composition.
	xcompmgr -f -D 5 &

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

	# Make Nautilus show the advanced permissions dialog.
	gconftool-2 -s -t bool /apps/nautilus/preferences/show_advanced_permissions true &

	trayer --align right --edge bottom --distance 0 \
		   --expand true \
		   --transparent true --alpha 128 --tint 0 \
		   --SetDockType true --SetPartialStrut true &

	nm-applet &
) &

exec ratpoison

