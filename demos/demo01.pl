#!/usr/bin/perl -w

# factorise a number

print "Number: ";
$n = <STDIN>;

@factors = ();

for ($i = 1; $i <= int($n**0.5); $i++) {
	if ($n % $i == 0) {
		push @factors, $i;
		if ($n/$i != $i) {
			push @factors, $n/$i;
		}
	}
}

# todo: make this sort numerically
foreach $i (sort @factors) {
	print "$i ";
}
print "\n";