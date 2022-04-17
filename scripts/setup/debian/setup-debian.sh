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

# Check if we have sudo available.
if ! [ -x "$(command -v sudo)" ]; then
	echo "You need sudo first. Please set it up, we'll give you a root shell:"
	su
fi

# Install of of the official packages needed.
echo "Installing all of the packages we need from the official repositories..."
sudo apt install build-essential dkms linux-headers-$(uname -r) git vim i3 \
	xinit tree xscreensaver xterm rxvt-unicode-256color terminator neofetch \
	screen nfs-common network-manager-pptp-gnome network-manager-l2tp-gnome \
	htop tigervnc-standalone-server tigervnc-common tigervnc-scraping-server \
	smbclient lxappearance picom feh cloc emacs curl zip unzip dosfstools \
	pcmanfm firefox-esr qutebrowser
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
git clone --recursive https://github.com/nathanpc/dotfiles.git ~/dotfiles
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
