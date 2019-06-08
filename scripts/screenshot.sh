#!/bin/bash

### screenshot.sh
### Takes a full-screen screenshot with a time delay.
###
### Author: Nathan Campos <nathanpc@dreamintech.net>

# Terminal coloring.
bold=$(tput bold)
normal=$(tput sgr0)

# Usage dialog.
function usage {
	echo "Usage: ${bold}$0${normal} delay"
	echo
	echo -e "    delay\tTime to delay the screenshot in seconds."
	echo

	exit 1
}

# The "main" function.
if [[ $# -gt 0 ]]; then
	# Take screenshot.
	scrot -c -d $1 -b -q 100 -m '/tmp/%Y-%m-%d_$wx$h.png' -e 'mv $f ~/Pictures/Screenshots/'
else
	# Need some help?
	usage
fi

