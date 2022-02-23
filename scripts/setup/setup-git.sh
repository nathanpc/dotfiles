#!/bin/bash

### setup-git.sh
### Sets up SSH keys and everything to make Git work.
###
### Author: Nathan Campos <nathan@innoveworkshop.com>

# Configuration variables.
email="nathan@innoveworkshop.com"
algorithm="ed25519"

# Setup SSH keys.
echo "Setting up SSH keys for use with Git..."
ssh-keygen -t $algorithm -C "$email"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_$algorithm
echo "Done."
echo ""

# Show public key to be copied.
echo "Copy this public key into your Git hosting platform for authentication:"
echo ""
echo "=============== COPY BELOW THIS LINE ==============="
cat ~/.ssh/id_$algorithm.pub
echo "=============== COPY ABOVE THIS LINE ==============="

