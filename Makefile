### Makefile
### Automates the setup of a new environment using GNU make.
###
### Author: Nathan Campos <nathan@innoveworkshop.com>

# Important directories.
DOTFILESDIR = $(HOME)/dotfiles
FONTSDIR = /usr/share/fonts

# Important commands.
LN = ln -sfn
MKDIR = mkdir -p
GIT = git
CURL = curl
WGET = wget
CD = cd

# Text snippets.
TXTDONE = 'Done.'

.PHONY: all shellconf bashconf editors vim emacs nano devenv gdbconf gitconf rconf octaveconf xserver xinit xresources xscreensaverconf consoleapps mutt screen termemus terminator urxvt fonts
all: xserver termemus consoleapps devenv editors shellconf fonts

#
# Shells
#
shellconf: bashconf

# Bash
bashconf: $(DOTFILESDIR)/bash/bash_profile $(DOTFILESDIR)/bash/bash_profile
	@echo "Setting up Bash..."
	@echo "    Symlinking dotfiles..."
	$(LN) $(DOTFILESDIR)/bash/bash_profile $(HOME)/.bash_profile
	$(LN) $(DOTFILESDIR)/bash/bash_aliases $(HOME)/.bash_aliases
	@echo "    Sourcing the new configuration..."
	bash $(HOME)/.bash_profile
	@echo "    Downloading Base16 Shell..."
	test -d $(HOME)/.config/base16-shell || $(GIT) clone https://github.com/chriskempson/base16-shell.git $(HOME)/.config/base16-shell
	#@echo "    Setting up the shell colors..."
	#bash -l -c base16_tomorrow-night
	@echo $(TXTDONE)

#
# Editors
#
editors: vim emacs nano

# Vim
vim: $(DOTFILESDIR)/vim/vim/ $(DOTFILESDIR)/vim/vimrc
	@echo "Setting up Vim..."
	@echo "    Symlinking dotfiles..."
	$(LN) $(DOTFILESDIR)/vim/vim/ $(HOME)/.vim
	$(LN) $(DOTFILESDIR)/vim/vimrc $(HOME)/.vimrc
	@echo "    Downloading Vundle..."
	test -d $(HOME)/.vim/bundle/Vundle.vim || $(GIT) clone https://github.com/VundleVim/Vundle.vim.git $(HOME)/.vim/bundle/Vundle.vim
	@echo $(TXTDONE)

# Emacs
emacs: $(DOTFILESDIR)/emacs.d/
	@echo "Setting up Emacs..."
	@echo "    Making sure Emacs dotfiles are up-to-date..."
	$(GIT) submodule update --recursive --remote
	@echo "    Symlinking dotfiles..."
	$(LN) $(DOTFILESDIR)/emacs.d/ $(HOME)/.emacs.d
	@echo $(TXTDONE)

# Nano
nano: $(DOTFILESDIR)/nanorc
	@echo "Setting up Nano..."
	@echo "    Symlinking dotfiles..."
	$(LN) $(DOTFILESDIR)/nanorc $(HOME)/.nanorc
	@echo $(TXTDONE)

#
# Development Environment
#
devenv: gdbconf gitconf rconf octaveconf

# GDB
gdbconf: $(DOTFILESDIR)/gdbinit
	@echo "Setting up GDB..."
	@echo "    Symlinking dotfiles..."
	$(LN) $(DOTFILESDIR)/gdbinit $(HOME)/.gdbinit
	@echo $(TXTDONE)

# Git
gitconf: $(DOTFILESDIR)/gitconfig
	@echo "Setting up Git..."
	@echo "    Symlinking dotfiles..."
	$(LN) $(DOTFILESDIR)/gitconfig $(HOME)/.gitconfig
	@echo $(TXTDONE)

# R
rconf: $(DOTFILESDIR)/Rprofile
	@echo "Setting up R..."
	@echo "    Symlinking dotfiles..."
	$(LN) $(DOTFILESDIR)/Rprofile $(HOME)/.Rprofile
	@echo $(TXTDONE)

# GNU Octave
octaveconf: $(DOTFILESDIR)/octaverc
	@echo "Setting up Octave..."
	@echo "    Symlinking dotfiles..."
	$(LN) $(DOTFILESDIR)/octaverc $(HOME)/.octaverc
	@echo $(TXTDONE)

#
# X Windows Server
#
xserver: xinit xresources xscreensaverconf

# Xinit
xinit: $(DOTFILESDIR)/xinitrc
	@echo "Setting up Xinit..."
	@echo "    Symlinking dotfiles..."
	$(LN) $(DOTFILESDIR)/xinitrc $(HOME)/.xinitrc
	@echo $(TXTDONE)

# Xresources
xresources: $(DOTFILESDIR)/Xresources
	@echo "Setting up Xresources..."
	@echo "    Symlinking dotfiles..."
	$(LN) $(DOTFILESDIR)/Xresources $(HOME)/.Xresources
	@echo "    Loading the new configuration..."
	xrdb -merge $(HOME)/.Xresources
	@echo $(TXTDONE)

# Xscreensaver
xscreensaverconf: $(DOTFILESDIR)/xscreensaver
	@echo "Setting up Xscreenaver..."
	@echo "    Symlinking dotfiles..."
	$(LN) $(DOTFILESDIR)/xscreensaver $(HOME)/.xscreensaver
	@echo "    Loading the new configuration..."
	-xscreensaver-command -restart
	@echo $(TXTDONE)

#
# Console Applications
#
consoleapps: mutt screen

# Mutt
mutt: $(DOTFILESDIR)/mutt/
	@echo "Setting up Mutt..."
	@echo "    Symlinking dotfiles..."
	$(LN) $(DOTFILESDIR)/mutt/ $(HOME)/.mutt
	@echo $(TXTDONE)

# GNU Screen
screen: $(DOTFILESDIR)/screenrc
	@echo "Setting up GNU Screen..."
	@echo "    Symlinking dotfiles..."
	$(LN) $(DOTFILESDIR)/screenrc $(HOME)/.screenrc
	@echo $(TXTDONE)

#
# Terminal Emulators
#
termemus: terminator urxvt

# Terminator
terminator: $(DOTFILESDIR)/terminator/
	@echo "Setting up Terminator..."
	@echo "    Symlinking dotfiles..."
	$(LN) $(DOTFILESDIR)/terminator/ $(HOME)/.config/terminator
	@echo $(TXTDONE)

urxvt: $(DOTFILESDIR)/urxvt/ $(DOTFILESDIR)/urlview
	@echo "Setting up URxvt..."
	@echo "    Symlinking dotfiles..."
	$(LN) $(DOTFILESDIR)/urxvt/ $(HOME)/.urxvt
	@echo "    Setting up UrlView..."
	$(LN) $(DOTFILESDIR)/urlview $(HOME)/.urlview
	@echo $(TXTDONE)

#
# Fonts
#

fonts: $(FONTSDIR)/truetype
	@echo "Setting up fonts..."
	@echo "    Downloading Liberation Nerd Font..."
	$(WGET) https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/LiberationMono.zip -O /tmp/LiberationMono.zip
	@echo "    Installing Liberation Nerd Font..."
	sudo $(MKDIR) $(FONTSDIR)/truetype/liberation
	sudo unzip /tmp/LiberationMono.zip -d $(FONTSDIR)/truetype/liberation
	@echo "    Updating the font cache..."
	fc-cache -f -v
	@echo $(TXTDONE)
