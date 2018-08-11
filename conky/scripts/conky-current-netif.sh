#!/bin/sh

netif=`ip addr | awk '/state UP/ {print $2}' | sed 's/.$//' | tail -n 1` # > ~/.conky/tmp/netif-up
printf "\${color}Download: \${color2}\${downspeed $netif}\${color}\${alignr}Upload: \${color2}\${upspeed $netif}\n\${downspeedgraph $netif 50,170} \${upspeedgraph $netif 50,170}"

