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
fish_add_path -P $HOME/dotfiles/scripts

# Interactive session-only stuff.
if status is-interactive
	# Pretty startup.
	if type -q neofetch
		neofetch
	end
end
