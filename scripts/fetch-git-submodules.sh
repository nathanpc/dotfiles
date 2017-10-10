#!/bin/sh

git submodule init --recursive
git submodule update --recursive --remote
#Older Git: git submodule update --recursive
