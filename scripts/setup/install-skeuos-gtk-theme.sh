#!/bin/bash

### install-skeuos-gtk-theme.sh
### Installs the beautiful, non-flat, Skeuos GTK theme to the system.
###
### Author: Nathan Campos <nathan@innoveworkshop.com>

echo "Installing the Skeuos GTK theme..."
echo ""
echo "Cloning the repo..."
git clone https://github.com/daniruiz/skeuos-gtk.git ~/forks/skeuos-gtk-theme
echo "Done."
pushd ~/forks/skeuos-gtk-theme
sudo make install
popd
echo "Done."
