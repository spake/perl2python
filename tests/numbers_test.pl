#!/usr/bin/perl -w

# this is more just testing that numbers themselves work
# all the arithmetic/logic operators are tested more thoroughly elsewhere

$a = -5;
$b = 9;
$c = -$a;
$d = -$b;
$e = $a * $b;
$f = $c * $d;

print "$a $b $c $d $e $f\n";

$b = 1.5;
$d = -1.5;
print "$a $b $c $d\n";