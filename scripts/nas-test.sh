#!/bin/bash
# nas-test.sh
# Tests the performance of a samba share mounted in the system.
#
# Author: Nathan Campos <nathanpc@dreamintech.net>

# Check for arguments.
if [ "$1" == "" ] || [ $# -gt 1 ]; then
	echo "Usage: $0 <mountpoint>"
	exit 1
fi

# Samba share mounting point.
testdir=$1/test

echo "Setting up test directory at $testdir"
mkdir -p $testdir

echo "Testing WRITE performance"
sync
dd if=/dev/zero of=$testdir/write.1 bs=1M count=1024 oflag=direct status=progress

echo "Testing READ performance"
sync
dd if=$testdir/write.1 of=/dev/null bs=1M count=1024 iflag=direct status=progress

echo "Cleaning up..."
sync
rm -r $testdir
