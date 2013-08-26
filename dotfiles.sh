#!/bin/bash

###
### dotfiles.sh
### Script to manage my dotfiles.
###

dir=~/dotfiles          # Repo directory.
olddir=~/.dotfiles_bkp  # Backup directory.
files="bash_profile bash_it conkyrc conky emacs emacs.d ttytterrc vim vimrc"  # Files to organize


echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

for file in $files; do
	echo "Backing up any existing dotfiles from ~ to $olddir"
	mv ~/.$file $olddir/

	if [ $? -eq 0 ]; then
		echo "Copying the backups from $olddir to $dir"
		cp -r $olddir/.$file $dir/$file
		
		echo "Creating symlink to $file in home directory."
		ln -sfn $dir/$file ~/.$file
	else
		echo -e "\e[1;31m$file backup failed. File ignored.\e[0m"
	fi
done
