#!/bin/bash

### backlight.sh
### A simple shell utility to set the display brightness.
###
### Author: Nathan Campos <nathanpc@dreamintech.net>

# Terminal coloring.
bold=$(tput bold)
normal=$(tput sgr0)

# Global variables.
monitor=$(xrandr | grep " connected" | cut -f1 -d " ")

# Usage dialog.
function usage {
	echo "Usage: ${bold}$0${normal} brightness [monitor]"
	echo
	echo -e "    brightness\tBrightness value from 0 to 100."
	echo -e "    monitor\tMonitor name."
	echo
	echo "Defaults:"
	echo "    monitor = $monitor"
	echo

	exit 1
}

# The "main" function.
if [[ $# -gt 0 ]]; then
	# Convert from 0 to 100 to decimal format.
	brightness=$(echo "scale=1; $1/100" | bc -l)
	xrandr --output $monitor --brightness $brightness
else
	# Looks like you need to see the usage dialog.
	usage
fi

