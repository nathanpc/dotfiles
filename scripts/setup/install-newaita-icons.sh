#!/bin/bash

### install-newaita-icons.sh
### Installs the beautiful Newaita icon theme to the system.
###
### Author: Nathan Campos <nathan@innoveworkshop.com>

echo "Installing the Newaita icon theme..."
echo ""
echo "Cloning the repo..."
git clone https://github.com/cbrnix/Newaita-reborn.git ~/forks/newaita-icons
echo "Done."
pushd /usr/share/icons
for dir in ~/forks/newaita-icons/*/; do
	echo "Symlinking $(basename $dir)..."
	sudo ln -s $dir
done
popd
echo "Done."
