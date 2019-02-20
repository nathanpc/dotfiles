#!/bin/bash
# Fancy i3lock configuration with blurred screenshot background.
# Based on https://github.com/petvas/i3lock-blur
#
# Author: Nathan Campos <nathanpc@dreamintech.net>

# Variables and settings.
lockbg=/tmp/lock-background.png
resolution=$(xrandr | grep 'current' | sed -E 's/.*current\s([0-9]+)\sx\s([0-9]+).*/\1x\2/')

# Use ffmpeg to quickly build the blurred image.
ffmpeg -f x11grab -video_size $resolution -y -i $DISPLAY -filter_complex "boxblur=10:1" -vframes 1 $lockbg -loglevel quiet

# Lock the screen.
i3lock -i $lockbg

# Clean the temporary background image.
rm $lockbg

