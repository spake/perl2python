#!/usr/bin/perl -w

# strings_test.pl

%h = (
    "perl" => "horrific",
);

@fib = (1, 1, 2, 3, 5, 8, 13);

print "perl is $h{perl}\n";
print "the third fibonacci number is $fib[2]\n";

$p = "perl";
$i = 2;

print "perl is $h{$p}\n";
print "the third fibonacci number is $fib[$i]\n";

# interpolation to the max
print "$p$fib[2]$fib[$i]$h{perl}$h{$p}$i\n";

# interpolation with expressions
$a = 2;
$b = 3;
$c = "pe";
$d = "rl";
print "$fib[$a+$b] $fib[$a*$b]\n";
print "$h{$c.$d}\n";