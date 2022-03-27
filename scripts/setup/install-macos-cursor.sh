#!/bin/bash

### install-macos-cursor.sh
### Installs the beautiful macOS cursor theme to the system.
###
### Author: Nathan Campos <nathan@innoveworkshop.com>

echo "Installing the macOS Monterey cursor theme..."
echo ""
echo "Downloading the files..."
pushd ~/downloads
wget https://github.com/ful1e5/apple_cursor/releases/download/v1.2.3/macOSMonterey.tar.gz
popd
echo "Done."
pushd /usr/share/icons
sudo tar zxvf ~/downloads/macOSMonterey.tar.gz
popd
echo "Done."
