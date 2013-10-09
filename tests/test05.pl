#!/usr/bin/perl -w

@a = ('a', 'b', 'c', 'd', 'e');

foreach $x (@a) {
	print "$x ";
}
print "\n";

foreach $i (0..$#a) {
	print "$a[$i] ";
}
print "\n";

for ($i = 0; $i <= $#a; $i++) {
	print "$a[$i] ";
}
print "\n";

for ($i = 0; $i < @a; $i++) {
	print "$a[$i] ";
}
print "\n";

# hard mode: hash keys
%h = (
	'x' => 1,
	'y' => 2,
	'z' => 3
);

foreach $x (keys %h) {
	print "$x ";
}
print "\n";

foreach $x (values %h) {
	print "$x ";
}
print "\n";