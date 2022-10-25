#!/bin/bash

### install-microsoft-fonts.sh
### Installs all of Microsoft's fonts for us.
###
### Author: Nathan Campos <nathan@innoveworkshop.com>

echo "Ensuring we have multiverse enabled..."
sudo apt-add-repository multiverse
echo "Done."
echo ""

echo "Installing the classic Microsoft fonts..."
sudo apt install ttf-mscorefonts-installer cabextract
echo "Done."
echo ""

echo "Installing Microsoft's Windows Vista fonts..."
wget "https://sourceforge.net/projects/mscorefonts2/files/cabs/PowerPointViewer.exe" -O /tmp/PowerPointViewer.exe
TMPDIR=`mktemp -d`
cabextract -L -F ppviewer.cab -d "$TMPDIR" /tmp/PowerPointViewer.exe
pushd $TMPDIR
mkdir fonts
cabextract -L -F '*.TT[FC]' -d ./fonts ppviewer.cab
cd fonts
mv cambria.ttc cambria.ttf
chmod 644 *
cd ..
sudo mv fonts /usr/share/fonts/truetype/msftvistafonts
popd
echo "Done."
echo ""

echo "Reloading font cache..."
fc-cache -fv
echo "Done."
echo ""

echo "Done."

