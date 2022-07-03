#!/bin/bash
### disable-double-space-period.sh
### Disables the annoying newer macOS insertion of a period after pressing the
### space bar twice quickly.
###
### Author: Nathan Campos <nathan@innoveworkshop.com>

defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -int 0

