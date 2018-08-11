#!/bin/sh
### conky-current-netif.sh
### Produces conky code with download and upload graphs for the current
### active network interface.
###
### Author: Nathan Campos <nathanpc@dreamintech.net>

netif=`ip addr | awk '/state UP/ {print $2}' | sed 's/.$//' | tail -n 1` # > ~/.conky/tmp/netif-up
printf "\${color}Download: \${color2}\${downspeed $netif}\${color}\${alignr}Upload: \${color2}\${upspeed $netif}\n\${downspeedgraph $netif 50,170} \${upspeedgraph $netif 50,170}"

