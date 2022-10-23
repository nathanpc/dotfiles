#!/bin/bash
### disable-macos-prompts.sh
### Disables the annoying newer macOS prompts that I can't stand.
###
### Author: Nathan Campos <nathan@innoveworkshop.com>

# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable Disk Image Verification: Verifying ...
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Disable the dumb verified developer thing.
spctl --master-disable

echo "Done."

