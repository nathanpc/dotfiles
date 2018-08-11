#!/bin/sh
ip addr | awk '/state UP/ {print $2}' | sed 's/.$//' | tail -n 1 > ~/.conky/tmp/netif-up
