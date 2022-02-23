#!/bin/bash

### setup-debian.sh
### Sets up Debian for us.
###
### Author: Nathan Campos <nathan@innoveworkshop.com>

# Simple pause implementation.
function pause {
	read -n1 -r -p "Press any key to continue..." key
}

# Fancy banner as usual.
echo "================================================================================"
echo "=                                                                              ="
echo "=                            Automated Debian Setup                            ="
echo "=                               by Nathan Campos                               ="
echo "=                                                                              ="
echo "================================================================================"
echo ""

# Install of of the official packages needed.
echo "Installing all of the packages we need from the official repositories..."
sudo apt install build-essential dkms linux-headers-$(uname -r) git vim i3 \
	tree xscreensaver xterm rxvt-unicode-256color terminator neofetch
ret=$?
if [ $ret -ne 0 ]; then
	exit 1
fi
echo "Done."

# Download dotfiles.
echo "Download dotfiles..."
git clone https://github.com/nathanpc/dotfiles.git ~/dotfiles
echo "Done."

# Setup Git.
echo "Setting up Git..."
. ~/dotfiles/scripts/setup/setup-git.sh
echo "Done."
echo "Setup your GitHub SSH keys now. We'll wait."
pause

# Fix up the dotfiles repository origin.
echo "Fixing the dotfiles repository origin URL..."
cd ~/dotfiles
git remote set-url origin git@github.com:nathanpc/dotfiles.git
echo "Done."

# Populate the submodules in the dotfiles repository.
echo "Downloading dotfiles submodules..."
git submodule update --init --recursive
echo "Done."

# Setup the dotfiles.
echo "Setting up the dotfiles..."
make
echo "Done."

