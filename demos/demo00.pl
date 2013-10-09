#!/usr/bin/perl -w

# read in a string as a number, then print out its digits

# array of decimal digits
@digits = ("zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine");

# read in a number from the user
$n = <STDIN>;

@output = ();

while ($n > 0) {
	$digit = $n % 10;
	push @output, $digits[$digit];

	$n = int($n/10);
}

@output = reverse @output;

print "@output\n";