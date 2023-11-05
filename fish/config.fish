# Exposes the OS variable globally.
set -gx OSNAME (uname -s)

# Mac-specific stuff.
if string match -q $OSNAME "Darwin"
	# Add iTerm 2 integration.
	test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

	# Add MacPorts to the system PATH.
	fish_add_path -P /opt/local/bin /opt/local/sbin
	set -q MANPATH || set MANPATH ''
	set -x MANPATH $MANPATH /opt/local/share/man
end

# Ensure Python packages are in our system PATH.
if type -q python3
	fish_add_path -P (python3 -m site --user-base)/bin
end

# Make sure our scripts, /usr/local/bin, and /sbin are in the system PATH.
fish_add_path /usr/local/sbin /usr/local/bin /sbin /usr/local/bin
fish_add_path -P ~/dotfiles/scripts

# Host-specific stuff.
test -r ~/.config/fish/config.(hostname -s).fish; and source ~/.config/fish/config.(hostname -s).fish
test -d ~/.config/fish/functions/(hostname -s); and set -gx fish_function_path ~/.config/fish/functions/(hostname -s) $fish_function_path
test -d ~/.config/fish/functions/(string lower $OSNAME); and set -gx fish_function_path ~/.config/fish/functions/(string lower $OSNAME) $fish_function_path

# Interactive session-only stuff.
if status is-interactive
	# Pretty startup.
	if type -q neofetch
		neofetch
	end
end
