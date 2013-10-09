#!/usr/bin/perl -w

# ACM South Pacific Programming Contest 2013, Problem A - Secure PINs

# Problem description:
# Most people are aware of the importance of selecting a good password for their
# computer and e-mail accounts. However, they pay little attention when they choose
# their credit card and bank card PINs, even though they can probably unlock a lot of wealth.
# Your task is to write a program to assess the security level of a collection of PINs.
# A PIN that contains the same digit three times or a sequence of three consecutive digits
# (such as 345 and 654) is to be assessed as weak. Otherwise, it is considered acceptable.
# Note that sequences that wrap around, like "391312" and "098165", are not considered consecutive.

$ntests = <STDIN> + 0;

for $i (1..$ntests) {
	# read in a pin
	$pin = <STDIN>;
	chomp $pin;

	# initialise frequency table
	@freqs = ();
	for $j (1..10) {
		push @freqs, 0;
	}

	# read each character of the pin and add to frequencies
	@chars = split //, $pin;
	for $j (0..5) {
		$char = $chars[$j];
		$freqs[int($char)]++;
	}

	$weak = 0;

	# are there any digits >= 3 times?
	for $j (0..9) {
		if ($freqs[$j] >= 3) {
			$weak = 1;
			last;
		}
	}

	if (!$weak) {
		# are there consecutive digits?
		for $j (0..3) {
			$a = $chars[$j];
			$b = $chars[$j+1];
			$c = $chars[$j+2];

			if ((($a == $b-1) && ($b == $c-1)) ||
				(($a-1 == $b) && ($b-1 == $c))) {
				$weak = 1;
				last;
			}
		}
	}

	if ($weak) {
		print "WEAK\n";
	} else {
		print "ACCEPTABLE\n";
	}
}