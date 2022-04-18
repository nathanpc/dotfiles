#!/bin/bash

### install-grub-theme.sh
# Installs a beautiful GRUB theme.
###
### Author: Nathan Campos <nathan@innoveworkshop.com>

echo "Installing GRUB theme..."
echo ""
echo "Cloning the repo..."
git clone https://github.com/vinceliuice/grub2-themes.git ~/forks/grub2-themes
echo "Done."
pushd ~/forks/grub2-themes
sudo ./install.sh -b -t tela
popd
echo "Done."
