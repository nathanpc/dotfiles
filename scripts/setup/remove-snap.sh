#!/bin/bash

### remove-snap.sh
### Completely purges the awful snap garbage from an Ubuntu system.
###
### Author: Nathan Campos <nathan@innoveworkshop.com>

echo "Removing snap cache..."
sudo rm -rf /var/cache/snapd/

echo "Purging the snap package..."
sudo umount /var/snap/firefox/common/host-hunspell
sudo apt autoremove --purge snapd gnome-software-plugin-snap

echo "Removing home snap directory..."
rm -rf ~/snap

echo "Ensuring snap doesn't come back..."
sudo apt-mark hold snapd

