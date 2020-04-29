#/bin/sh

### create-timelapse.sh
### Creates timelapse videos using a bunch of images. Great if you use the
### old GoPro's timelapse function which just gives you a bunch of images.
###
### Author: Nathan Campos <nathan@innoveworkshop.com>

photodir=$1
curdate=`date +"%Y%m%d%H%M%S"`
tmplist="/tmp/timelapse-$curdate.txt"
outfile=$2

if [[ $# -lt 2 ]]; then
	echo "Usage: $0 photodir outfile"
	echo
	echo -e "    photodir\tDirectory where all your JPEGs are."
	echo -e "    outfile\tOutput file with AVI extension."
	echo

	exit 1
fi

ls -1 $photodir/*.JPG > $tmplist
mencoder -nosound -noskip -oac copy -ovc copy -lavcopts vcodec=mpeg4 -o "$outfile" -mf type=jpeg:fps=30 "mf://@$tmplist"

