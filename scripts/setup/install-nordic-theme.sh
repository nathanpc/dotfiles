#!/bin/bash

### install-nordic-theme.sh
### Installs the beautiful Nordic theme on a bunch of stuff.
###
### Author: Nathan Campos <nathan@innoveworkshop.com>

echo "Installing the Nordic GTK theme..."
wget https://github.com/EliverLara/Nordic/releases/download/v2.2.0/Nordic.tar.xz -O /tmp/nordic-gtk.tar.xz
pushd /usr/share/themes/
sudo tar xvf /tmp/nordic-gtk.tar.xz
popd
echo "Done."
echo ""

echo "Installing the Nordic Gedit theme..."
pushd /usr/share/gtksourceview-3.0/styles
sudo wget https://raw.githubusercontent.com/arcticicestudio/nord-gedit/develop/src/xml/nord.xml -O Nord.xml
popd
echo "Done."
echo ""

echo "Installing the Nordic Gnome Terminal theme..."
git clone https://github.com/arcticicestudio/nord-gnome-terminal.git /tmp/nord-gnome-terminal
pushd /tmp/nord-gnome-terminal/src
./nord.sh
popd
echo "Done."
echo ""

echo "Installing the Nordic Firefox theme..."
echo "Cloning the repo..."
git clone https://github.com/EliverLara/firefox-nordic-theme ~/forks/nordic-firefox-theme
echo "Done."
pushd ~/forks/nordic-firefox-theme
./scripts/install.sh
popd
echo ""

echo "Done."
