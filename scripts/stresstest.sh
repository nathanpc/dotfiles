#!/bin/sh

# stresstest
# A very simple script to run both stress and cpuburn stress test utilities.
#
# Nathan Campos <nathanpc@dreamintech.net>

# TODO: Make a way to set the time and select which utility to use.
#       Also make sure to expand this so it's better looking.

while true; do vcgencmd measure_clock arm; vcgencmd measure_temp; sleep 10; done& stress -c 1 -t 900s

#while true; do vcgencmd measure_clock arm; vcgencmd measure_temp; sleep 10; done& cpuburn
