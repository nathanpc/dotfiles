#!/bin/sh

wget -m -np -e robots=off --convert-links --no-check-certificate --compression=auto --page-requisites --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36" $1
