#!/bin/sh

# Execute the system's xinitrc.
. /etc/X11/xinit/xinitrc

# Setup dual monitors.
#xrandr --output HDMI1 --auto --output HDMI2 --auto --right-of HDMI1

# Setup some X options.
xset b off  # Turn bell off.
xset s off  # Turn screensaver off.

# Start screensaver.
screensaver -nosplash &

# Start the window manager.
exec i3

