#!/bin/sh

### backup-whole-system.sh
### A simple script to backup a whole Linux system in one go. Grabbing only
### the important bits.
###
### Author: Nathan Campos <nathan@innoveworkshop.com>

# Check if running as root.
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root."
	exit 1
fi

starttime=`date`

# Switch to /
echo "Switching to the filesystem root"
cd /

# Build the archive filename.
fname=`hostname`
fname+='-'
fname+=`date -u +"%Y-%m-%d-T%H%M"`
fname+=".tar.bz2"
echo "Saving the backup as $fname"

# Make the archive.
echo "Building the backup archive"
tar -cvpjf $fname \
	--exclude=/$fname \
	--exclude=/mnt \
	--exclude=/dev \
	--exclude=/sys \
	--exclude=/proc \
	--exclude=/media \
	--exclude=/var/log \
	--exclude=/var/cache/apt/archives \
	--exclude=/usr/src/linux-headers* \
	/

endtime=`date`
echo "Done!"
echo "Started at $starttime"
echo "Finished at $endtime"

