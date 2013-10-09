#!/usr/bin/perl -w

sub rot13 {
	$old_string = shift;
	chomp $old_string;

	@chars = split //, $old_string;
	$new_string = "";

	foreach $char (@chars) {
		$i = ord($char);

		if ($i >= ord('a') && $i <= ord('z')) {
			$i -= ord('a');
			$i = ($i + 13) % 26;
			$i += ord('a');
			$char = chr($i);
		} elsif ($i >= ord('A') && $i <= ord('Z')) {
			$i -= ord('A');
			$i = ($i + 13) % 26;
			$i += ord('A');
			$char = chr($i);
		}

		$new_string .= $char;
	}

	return $new_string;
}

$counter = 0;
while ($line = <>) {
	printf "Line %3d: %s\n", $counter, rot13($line);
	$counter++;
}