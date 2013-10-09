#!/usr/bin/perl -w

%h = (
	"c" => "cool",
	"python" => "fun",
	"java" => "reasonable",
	"perl" => "satan incarnate"
);

print sort keys %h;
print "\n";
print sort values %h;
print "\n";

foreach $key (sort keys %h) {
	print "$key\n";
}
