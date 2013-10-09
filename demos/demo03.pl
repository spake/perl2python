#!/usr/bin/perl -w

# calculate triangular numbers

sub tri {
	$n = shift;
	$sum = 0;
	while ($n >= 1) {
		$sum += $n;
		$n--;
	}
	return $sum;
}

while ($line = <STDIN>) {
	print tri($line), "\n";	
}