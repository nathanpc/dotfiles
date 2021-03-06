#!/bin/sh

### screen-rotate
### Rotates a specific screen to where you want. This is basically just a
### simple wrapper for a xrandr command.
###
### Usage: screen-rotate [screen] <direction>
###
### Author: Nathan Campos <nathanpc@dreamintech.net>

if [ $# -eq 1 ]; then
	# Grabs the primary monitor to rotate.
	XDISPLAY=`xrandr --current | grep primary | sed -e 's/ .*//g'`
	xrandr --output $XDISPLAY --rotate $1
elif [ $# -eq 2 ]; then
	# User selected a specific monitor to rotate.
	xrandr --output $1 --rotate $2
else
	# Wrong number of arguments.
	echo 'Usage: screen-rotate [screen] <direction>'
fi

