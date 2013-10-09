#!/usr/bin/perl -w

# open a regular file for reading
open F, "< test_file";
# print some lines
while ($line = <F>) {
	print $line;
}
close F;

