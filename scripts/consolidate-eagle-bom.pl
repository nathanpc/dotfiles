#!/usr/bin/env perl

=head1 NAME

C<App::ConsolidateEagleBOM> - Consolidates a bunch of eagle BOMs into one.

=cut

package App::ConsolidateEagleBOM;

use strict;
use warnings;
use autodie;
use utf8;
use Scalar::Util qw(looks_like_number);
use Text::CSV qw(csv);
use Class::Struct;

# Global variables.
our @bom_items = ();

# Component structure.
struct Item => {
	quantity    => '$',
	value       => '$',
	device      => '$',
	'package'   => '$',
	description => '$'
};

=head1 METHODS

=over 4

=item C<main>()

Program's main entry point.

=cut

sub main {
	# Enable UTF-8 output.
	binmode STDOUT, ":encoding(utf8)";

	# Go through the supplied Eagle BOM CSV files.
	my $board_quantity = 1;
	foreach my $bomfile (@ARGV) {
		# Check if we have a board count argument.
		if (looks_like_number($bomfile)) {
			$board_quantity = int($bomfile);
			next;
		}

		# Parse the CSV file.
		my $bomcsv = csv(in => $bomfile, sep_char=> ';');

		# Go through the rows in the BOM.
		foreach my $row (@$bomcsv) {
			# Ignore the header row.
			next if ($row->[0] eq 'Qty');

			# Get some basic data.
			my $item = row_to_item($row, $board_quantity);
			my $item_idx = item_index($item);
			
			# Push the new item into the array if it's completely new to us.
			if ($item_idx < 0) {
				push @bom_items, $item;
				next;
			}

			# Update the item's quantity.
			$bom_items[$item_idx]->quantity(
				$bom_items[$item_idx]->quantity + $item->quantity);
		}

		# Reset the board quantity.
		$board_quantity = 1;
	}

	# Print out the consolidated BOM.
	print '"Qty","Value","Device","Package","Description"' . "\n";
	foreach my $item (@bom_items) {
		print qstr($item->quantity) . ',' . qstr($item->value) . ',' .
			qstr($item->device) . ',' . qstr($item->package) . ',' .
			qstr($item->description) . "\n";
	}
}

=item I<$item> = C<row_to_item>(I<\@row>, I<$lot>)

Converts a BOM item CSV row array reference (I<\@row>) to an I<Item> structure
object and multiplies the quantity by I<$lot>.

=cut

sub row_to_item {
	my ($row, $lot) = @_;

	return Item->new(
		quantity    => int($row->[0]) * $lot,
		value       => $row->[1],
		device      => $row->[2],
		'package'   => $row->[3],
		description => $row->[5]
	);
}

=item I<$equal> = C<item_equals>(I<$item1>, I<$item2>)

Compares two I<Item> structures and determines if they are equal to eachother
ignoring the I<quantity> field.

=cut

sub item_equals {
	my ($item1, $item2) = @_;

	return (($item1->value eq $item2->value) and
		($item1->device eq $item2->device) and
		($item1->package eq $item2->package) and
		($item1->description eq $item2->description));
}

=item I<$index> = C<item_index>(I<$item>)

Gets the index of an I<$item> in the I<@bom_items> array or I<-1> if it isn't
there yet.

=cut

sub item_index {
	my ($item) = @_;

	# Go through the items array trying to find our item.
	for (my $i = 0; $i < scalar(@bom_items); $i++) {
		# Check if the item is in the array and return its index.
		if (item_equals($bom_items[$i], $item)) {
			return $i;
		}
	}

	# Didn't find a matching item in the array.
	return -1;
}

=item I<$quostr> = C<qstr>(I<$str>)

Returns the string (I<$str>) enclosed in double-quotes. Example: I<hello> will
become I<"hello">.

=cut

sub qstr {
	my ($str) = @_;
	return "\"$str\""
}

# Start the program.
main();

=back

=head1 AUTHOR

Nathan Campos <nathan@innoveworkshop.com>

=head1 COPYRIGHT

Copyright (c) 2022- Nathan Campos.

=cut
