#!/bin/bash

### setup-ch340.sh
### Sets up the CH340 drivers on Linux.
###
### Author: Nathan Campos <nathan@innoveworkshop.com>

echo "Forking the patched CH340 drivers..."
git clone https://github.com/juliagoda/CH341SER.git ~/forks/ch341ser
pushd ~/forks/ch341ser
echo "Done."
echo ""

echo "Building the kernel module..."
make
echo "Done."
echo ""

echo "Loading the kernel module..."
sudo make load
popd
echo "Done."
echo ""

# More info: https://unix.stackexchange.com/a/680547
echo "Fixing conflict with other devices..."
sudo sed -ie 's|\(ENV{PRODUCT}=="1a86/7523/\*", ENV{BRLTTY_BRAILLE_DRIVER}="bm", GOTO="brltty_usb_run"\)|#\1|' /usr/lib/udev/rules.d/85-brltty.rules
echo "Done."
echo ""

echo "Done."

