#!/usr/bin/perl -w

# multiplication table

$limit = 31;

for $i (1..$limit) {
	for $j (1..$limit) {
		printf "%3d ", $i*$j;
	}
	print "\n";
}