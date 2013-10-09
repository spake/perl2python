#!/usr/bin/perl -w

sub test_function {
	print "Hello, World!\n";
}

sub test_return {
	return 9;
}

sub test_args {
	@args = @_;
	while (@args) {
		$a = pop @args;
		print "$a";
	}
	print "\n";
}

sub test_args2 {
	$a = shift @_;
	$b = shift @_;

	print "$a $b\n";
}

sub test_args3 {
	$a = shift;
	$b = shift;

	print "$a, $b\n";
}

sub multiply {
	$a = shift;
	$b = shift;
	$c = $a * $b;
	return $c;
}

sub sum {
	$n = 0;
	while (@_) {
		$n += shift;
	}
	return $n;
}

test_function;
print test_return;
print "\n";

test_args(1,3,5,7,9);
test_args(3,2,1);
test_args(1);
test_args();
test_args2('one', 'two');
test_args3('x', 'y');
print multiply(6, 9), "\n";
print sum(1), "\n";
print sum(1,42,99,5,0), "\n";
