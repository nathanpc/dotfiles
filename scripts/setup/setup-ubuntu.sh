#!/bin/bash

### setup-ubuntu.sh
### Sets up Ubuntu for us.
###
### Author: Nathan Campos <nathan@innoveworkshop.com>

# Simple pause implementation.
function pause {
	read -n1 -r -p "Press any key to continue..." key
}

# Fancy banner as usual.
echo "================================================================================"
echo "=                                                                              ="
echo "=                            Automated Ubuntu Setup                            ="
echo "=                               by Nathan Campos                               ="
echo "=                                                                              ="
echo "================================================================================"
echo ""

# Check if we have sudo available.
if ! [ -x "$(command -v sudo)" ]; then
	echo "You need sudo first. Please set it up, we'll give you a root shell:"
	su
fi

# Install of of the official packages needed.
echo "Installing all of the packages we need from the official repositories..."
sudo apt install build-essential dkms linux-headers-$(uname -r) git vim tree \
	terminator neofetch screen nfs-common network-manager-pptp-gnome \
	network-manager-l2tp-gnome htop smbclient cloc emacs curl zip unzip \
	dosfstools rar unrar p7zip-full imagemagick perl-doc bat gnome-tweaks

ret=$?
if [ $ret -ne 0 ]; then
	exit 1
fi
echo "Done."

# Creating some of our commonly-used directories.
echo "Creating commonly-used directories..."
echo "Creating ~/downloads..."
mkdir ~/downloads
echo "Creating ~/forks..."
mkdir ~/forks
echo "Creating ~/src..."
mkdir ~/src
echo "Done."

# Download dotfiles.
echo "Download dotfiles..."
git clone --recursive git@github.com:nathanpc/dotfiles.git ~/dotfiles
cd ~/dotfiles
echo "Done."

# Populate the submodules in the dotfiles repository.
echo "Downloading dotfiles submodules..."
git submodule update --init --recursive
echo "Done."

# Setup the dotfiles.
echo "Setting up the dotfiles..."
make
echo "Done."
