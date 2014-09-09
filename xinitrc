#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
        for f in /etc/X11/xinit/xinitrc.d/*; do
                [ -x "$f" ] && . "$f"
        done
        unset f
fi

# Update the X resources database.
xrdb -merge ~/.Xresources

# Setup the touchpad.
synclient TapButton1=1 &
synclient &

