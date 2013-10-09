#!/usr/bin/perl -w

# uniq.pl

$last_line = "";

while ($line = <>) {
	if ($last_line ne $line) {
		$last_line = $line;

		print $line;
	}
}