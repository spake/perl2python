#!/usr/bin/perl -w

# regex_test.pl

$p = "wat";

# interpolation in regex
$a = "hello, world";
$a =~ s/\w/$p/;
print "$a\n";

$a =~ s/L/$p/gi;
print "$a\n";

if ($a =~ /$p/) {
	print "woo!\n";
}

# test loops with regex conditions on non-trivial variables (array indexing)
@a = ("one", "two", "three", "four", "five", "qqq", "six", "seven");

$i = 0;
while ($a[$i] =~ /[aeiou]/) {
	print "$a[$i]\n";
	$i++;
}

# another while test: remove vowels one at a time
$s = "the quick brown fox";
print "$s\n";

while ($s =~ /[aeiou]/) {
	$s =~ s/[aeiou]//;
	print "$s\n";
}

# do something similar, but on a hash
%h = (
	"a" => "hello",
	"b" => "perl is terrible",
	"c" => "qqq"
);

foreach $key (sort keys %h) {
	print "$h{$key}\n";

	while ($h{$key} =~ /[aeiou]/) {
		$h{$key} =~ s/[aeiou]//;
		print "$h{$key}\n";
	}
}

# retarded regex with backslashes
$a = "\\nhello\nworld\\!\\w";
$a =~ s/\\//g;
print "$a\n";
$a =~ s/\n//g;
print "$a\n";

# some more stuff with weird characters
$a = "hi";
if ($a =~ /^hi$/) {
	print "correct 1\n";
}
if ($a =~ /^h/) {
	print "correct 2\n";
}
if ($a =~ /i$/) {
	print "correct 3\n";
}
if ($a =~ /^/) {
	print "correct 4\n";
}
if ($a =~ /$/) {
	print "correct 5\n";
}
if ($a =~ /[aeou]/) {
} else {
	print "correct 6\n";
}
if ($a =~ /[aeiou]/) {
	print "correct 7\n";
}

$a = "hello|world";
$a =~ s/\|//;
print "$a\n";

# lastly, test i on its own
$a = "Hello World";
$a =~ s/[a-z]/*/i;
print "$a\n";

$a = "Hello World";
$a =~ s/[a-z]/*/g;
print "$a\n";

$a = "Hello World";
$a =~ s/[a-z]/*/gi;
print "$a\n";

$a = "Hello World";
$a =~ s/[a-z]/*/ig;
print "$a\n";

# test matches
$a = "Hello 50 World";
$a =~ /([0-9])/;
print "$1\n";
$a =~ /([A-Z][a-z]{4})/;
print "$1\n";
$a =~ /([A-Z])([a-z]{4})/;
print "$1 $2\n";