#!/bin/bash

for i in *.flac ; do
	avconv -i "$i" -acodec libmp3lame -ab 320k "${i[@]/%flac/mp3}"
	sleep 60
done
