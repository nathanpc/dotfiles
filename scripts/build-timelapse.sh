#!/bin/bash

### build-timelapse.sh
### Creates a timelapse video from a sequence of GoPro image folders.
###
### Author: Nathan Campos <nathan@innoveworkshop.com>

# Go through directories building videos from them.
echo "Generating a timelapse for each folder created by the camera..."
index=0
for dir in *; do
	if [ -d "$dir" ]; then
		pushd "$dir"
		fname=`printf "../%03d.mp4" $index`
		ffmpeg -framerate 30 -pattern_type glob -i "*.JPG" -c:v libx264 \
			-crf 18 "$fname"
		popd

		((index++))
	fi
done

# Concatenate the videos into a single one.
echo "Concatenating videos into a continuous timelapse..."
printf "file '%s'\n" *.mp4 > videolist.txt
ffmpeg -f concat -i videolist.txt -c copy timelapse.mp4
rm videolist.txt

# Make a 1080p version for ease of sharing.
echo "Creating a 1080p version of the timelapse..."
ffmpeg -i timelapse.mp4 -vf 'scale=-2:1080' -c:v libx264 -crf 18 \
	timelapse-1080p.mp4

echo "Done"
