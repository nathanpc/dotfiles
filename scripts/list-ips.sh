#!/bin/sh

## list-ips
## Prints all the IPs for screen's status bar.

ip addr | grep -E "inet[^6]192" | sed 's/\/[0-9][0-9]//' | awk '{ printf " %s: %s", $NF, $2 }'
