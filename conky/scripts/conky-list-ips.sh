#!/bin/sh
### conky-list-ips.sh
### Produces conky code with a list of the IPs for the current computer.
###
### Author: Nathan Campos <nathanpc@dreamintech.net>

netifs=`ip addr | awk '/state UP/ {print $2}' | sed 's/.$//'`

for intf in $netifs; do
	echo "$intf\${alignr}\${addr $intf}"
done

printf "Public\${alignr}%s" `dig +short myip.opendns.com @resolver1.opendns.com`

