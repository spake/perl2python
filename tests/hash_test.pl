#!/usr/bin/perl -w

# hash_test.pl

%h = (
	"c" => "cool",
	"python" => "fun",
	"java" => "reasonable",
	"perl" => "satan incarnate"
);

%h2 = ();

print sort keys %h;
print "\n";
print sort values %h;
print "\n";

print keys %h2;
print values %h2;
print "\n";

foreach $key (sort keys %h) {
	print "$key\n";
}
