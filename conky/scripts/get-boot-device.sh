#!/bin/sh
awk '$1 ~ /^\/dev\// && $2 == "/" { print $1 }' /proc/self/mounts | sed 's/p?.$//'
