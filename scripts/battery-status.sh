#!/bin/sh

## battery-status
## Just a simple "alias" for upower.

upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|percentage" | awk '{ if ($2 == "charging" || $2 == "fully-charged") printf "%s", "^"; else if ($2 == "discharging") printf ""; else printf "%s", $2; }'
