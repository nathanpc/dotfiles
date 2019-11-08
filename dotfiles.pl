#!/usr/bin/perl

use strict;
use warnings;
use autodie;

package Dotfiles::SimpleManager;

use Data::Dumper;
use Term::ANSIColor;
use Sys::Hostname;
use File::Basename;
use File::Spec;
use Cwd;
use Carp;

my @dotfiles = (
	{ name => "bash", sources => [ "bashrc/{host}" ], targets => [ "~/.bashrc" ], hostspecific => 1 },
	{ name => "conky", sources => [ "conky/conkyrc", "conky" ] , targets => [ "~/.conkyrc", "~/.conky" ], hostspecific => 0 },
	{ name => "drive", sources => [ "driverc" ], targets => [ "~/.driverc" ], hostspecific => 0 },
	{ name => "emacs", sources => [ "emacs.d" ], targets => [ "~/.emacs.d" ], hostspecific => 0 },
	{ name => "gdb", sources => [ "gdbinit" ], targets => [ "~/.gdbinit" ], hostspecific => 0 },
	{ name => "git", sources => [ "gitconfig" ], targets => [ "~/.gitconfig" ], hostspecific => 0 },
	{ name => "i3", sources => [ "i3/{host}" ], targets => [ "~/.config/i3/config" ], hostspecific => 1 },
	{ name => "i3status", sources => [ "i3status/{host}" ], targets => [ "~/.config/i3status/config" ], hostspecific => 1 },
	{ name => "mutt", sources => [ "mutt" ], targets => [ "~/.mutt" ], hostspecific => 0 },
	{ name => "nano", sources => [ "nanorc" ], targets => [ "~/.nanorc" ], hostspecific => 0 },
	{ name => "octave", sources => [ "octaverc" ], targets => [ "~/.octaverc" ], hostspecific => 0 },
	{ name => "r", sources => [ "Rprofile" ], targets => [ "~/.Rprofile" ], hostspecific => 0 },
	{ name => "ratpoison", sources => [ "ratpoisonrc" ], targets => [ "~/.ratpoisonrc" ], hostspecific => 0 },
	{ name => "rofi", sources => [ "rofi" ], targets => [ "~/.config/rofi/config" ], hostspecific => 0 },
	{ name => "rtorrent", sources => [ "rtorrent.rc" ], targets => [ "~/.rtorrent.rc" ], hostspecific => 0 },
	{ name => "scim", sources => [ "scimrc" ], targets => [ "~/.scimrc" ], hostspecific => 0 },
	{ name => "screen", sources => [ "screenrc" ], targets => [ "~/.screenrc" ], hostspecific => 0 },
	{ name => "terminator", sources => [ "terminator" ], targets => [ "~/.config/terminator/config" ], hostspecific => 0 },
	{ name => "urlview", sources => [ "urlview" ], targets => [ "~/.urlview" ], hostspecific => 0 },
	{ name => "urxvt", sources => [ "urxvt" ], targets => [ "~/.urxvt" ], hostspecific => 0 },
	{ name => "vim", sources => [ "vim/vimrc", "vim/vim" ], targets => [ "~/.vimrc", "~/.vim" ], hostspecific => 0 },
	{ name => "xinit", sources => [ "xinitrc" ], targets => [ "~/.xinitrc" ], hostspecific => 0 },
	{ name => "Xresources", sources => [ "Xresources" ], targets => [ "~/.Xresources" ], hostspecific => 0 },
	{ name => "xscreensaver", sources => [ "xscreensaver" ], targets => [ "~/.xscreensaver" ], hostspecific => 0 },
	{ name => "zathura", sources => [ "zathurarc" ], targets => [ "~/.config/zathura/zathurarc" ], hostspecific => 0 }
);

# Creates a list of dotfiles for the machine its been called from.
sub get_dotfiles {
	my %files;
	my $hostname = hostname();
	my $dotpath = File::Spec->catdir(Cwd->abs_path, dirname(__FILE__));
	$dotpath =~ s/Cwd\/?//;

	# Iterate over the list of dotfiles.
	for my $file (@dotfiles) {
		$files{$file->{name}} = { sources => [], targets => [] };

		for my $orig_source (@{$file->{sources}}) {
			my $source = File::Spec->catdir($dotpath, $orig_source);

			# Substitute the hostname where applicable.
			if ($file->{hostspecific}) {
				$source =~ s/\{host\}/\Q$hostname\E/;
			}

			# Check if source file exists.
			if (!-e $source) {
				print colored("Warning: ", "yellow") . "Source '$source' for '"
					. $file->{name} . "' doesn't exist.\n";
				next;
			}

			# Append dotfile sources to the list.
			push @{$files{$file->{name}}{sources}}, File::Spec->rel2abs($source);
		}

		# Append dotfile targets to the list.
		for my $target (@{$file->{targets}}) {
			push @{$files{$file->{name}}{targets}}, glob($target);
		}
	}

	return %files;
}

# Creates symlinks for a dotfile.
sub create_symlinks {
	my ($name, $files, $force) = @_;

	# Check if the requested name exists.
	print "Checking if " . colored($name, "blue") .
		" exists in your dotfiles... ";
	if (exists($files->{$name})) {
		print colored("OK", "green") . "\n";

		for (my $i = 0; $i < scalar(@{$files->{$name}->{targets}}); $i++) {
			my $target  = $files->{$name}->{targets}[$i];
			my $source  = $files->{$name}->{sources}[$i];

			# Check if the target already exists.
			print "Checking if the target " . colored($target, "blue") .
				" is available... ";
			if (-e $target) {
				# File already exists.
				if ($force) {
					print colored("IGNORED", "yellow") . "\n";
				} else {
					print colored("FAIL", "red") . "\n";
					die "Target file for '$name' already exists at '$target'." .
						" Use the flag '-sf' to force a overwrite.";
				}
			} else {
				# Target doesn't exist yet.
				print colored("OK", "green") . "\n";
			}

			print "Creating symlink... " . colored($target, "cyan") .
				" -> " . colored($source, "blue");

			# Remove the target file in a overwrite situation.
			if ($force) {
				unlink $target;
			}

			# Create actual symlink.
			if (symlink $source, $target) {
				print colored(" OK", "green") . "\n";
			} else {
				print colored(" FAIL", "red") . "\n";
			}
		}
	} else {
		# Can't find a dotfile with that name.
		print colored("FAIL", "red") . "\n";
		die "Can't find a dotfile named '$name'";
	}
}

# Lists dotfiles in a pretty way.
sub list_dotfiles {
	my ($files) = @_;

	print "List of available dotfiles:\n\n";

	for my $progname (sort(keys %{$files})) {
		my $file = $files->{$progname};

		print colored($progname, "blue") . "\n";

		for (my $i = 0; $i < scalar(@{$file->{targets}}); $i++) {
			my $target  = $file->{targets}[$i];
			my $source  = $file->{sources}[$i];

			print "    " . File::Spec->abs2rel($target, "/home/nathan/") .
				"  ->  " . File::Spec->abs2rel($source, "/home/nathan") . "\n";
		}
	}
}

# Usage screen.
sub usage {
	print "Usage: $0 <options> [program]\n\n";

	print colored("Options:", "bold") . "\n";
	print "    -l           \tLists the available dotfiles.\n";
	print "    -s [program] \tCreates symlinks of dotfiles for a given program.\n";
	print "    -sf [program]\tForcefully creates symlinks of dotfiles for a given program.\n";
	print "    -h           \tThis message.\n";
}

# The main entry point.
sub main {
	# Get dotfiles specified in the configuration.
	my %files = get_dotfiles();

	# Check for command-line arguments.
	if (scalar(@ARGV) > 0) {
		if ($ARGV[0] eq "-h") {
			# Show usage.
			usage();
		} elsif ($ARGV[0] eq "-l") {
			# List available dotfiles.
			list_dotfiles(\%files);
		} elsif (($ARGV[0] eq "-s") or ($ARGV[0] eq "-sf")) {
			# Create symlinks.
			if (scalar(@ARGV) > 1) {
				create_symlinks($ARGV[1], \%files, $ARGV[0] eq "-sf");
			} else {
				usage();
			}
		} else {
			# Invalid option.
			usage();
		}
	} else {
		# Display usage message.
		usage();
	}
}

main();
1;

__END__

=head1 NAME

Dotfiles::SimpleManager - Simple tool to manage your dotfiles.

=head1 METHODS

=over 4

=item I<%files> = C<get_dotfiles>()

Parses the dotfiles configuration and returns a organized hash with paths.

=item C<create_symlinks>(I<$name>, I<\%files>)

Creates a symlink for a program named I<$name> and grab the paths from
I<\%files>.

=item C<list_dotfiles>(I<\%files>)

Grabs the I<\%files> hash and pretty prints all of its contents.

=item C<usage>()

Prints a simple usage message for the user.

=item C<main>()

The prorgam main entry point.

=back

=head1 AUTHOR

Nathan Campos <nathanpc@dreamintech.net>

=head1 COPYRIGHT

Copyright (c) 2019 Nathan Campos.

=cut
