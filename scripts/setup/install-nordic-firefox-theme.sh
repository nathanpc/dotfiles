#!/bin/bash

### install-nordic-firefox-theme.sh
### Installs the beautifu Nordic Firefox theme.
###
### Author: Nathan Campos <nathan@innoveworkshop.com>

echo "Installing the Nordic Firefox theme..."
echo ""
echo "Cloning the repo..."
git clone https://github.com/EliverLara/firefox-nordic-theme ~/forks/nordic-firefox-theme
echo "Done."
pushd ~/forks/nordic-firefox-theme
./scripts/install.sh
popd
echo "Done."
