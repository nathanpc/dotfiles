#!/bin/sh
### conky-list-fs-usage.sh
### Produces conky code with a list of the mounted devices and their
### respective percentage of usage.
###
### Author: Nathan Campos <nathanpc@dreamintech.net>

for media in /media/$USER/*/; do
	if [ -d $media ]; then
		printf "\n$(basename $media) \${alignr}\${fs_used $media}/\${fs_size $media}\n\${fs_bar 6 $media}"
	fi
done

