#!/usr/bin/perl -w

# here we shall test built in functions in perl

# printf
$a = 5.;
printf "%d %.2f\n", $a, $a;
$b = -9.;
printf("%d %.2f\n", $b, $b);

# chomp
$a = "\n \n hello \n \n";
print $a;
chomp $a;
print $a;
chomp($a);
print($a);

# split
$s = "perl is evil, open your eyes sheeple";
@a = split " ", $s;
print "@a\n";
@a = split / /, $s;
print "@a\n";
@a = split //, $s;
print "@a\n";

@a = split(" ", $s);
print "@a\n";
@a = split(/ /, $s);
print "@a\n";
@a = split(//, $s);
print "@a\n";

$s = "the quick brown fox";
@a = split "quick", $s;
print "@a\n";
@a = split /[aeiou]/, $s;
print "@a\n";

$s = "";
print split " ", $s;
print split / /, $s;
print split //, $s;

# join
@a = ("hi", "there!", "please", "give", "me", "good", "marks", ":(");
$s = join " ", @a;
print $s;
print join("--", @a);

@a = ();
print join " ", @a;
print join("--", @a);

print "\n";

# push/pop
@a = ();
push @a, 1;
push @a, 2;
push(@a, 3);
print pop @a;
print pop @a;
print(pop(@a));
print "\n";

# unshift/shift
@a = ();
unshift @a, 1;
unshift @a, 2;
unshift(@a, 3);
print shift @a;
print shift @a;
print(shift(@a));
print "\n";

# a combination of the above
@a = (0);
push @a, 1;
unshift @a, 2;
print pop @a;
print pop @a;
print pop @a;
push @a, 1;
push @a, 9;
print shift @a;
print shift @a;
print "\n";

# array reversing
@a = ();
@b = reverse @a;
print "@a @b\n";
@a = (1,3,5);
@b = reverse(@a);
print "@a @b\n";
@a = ("one", "two", "three");
@b = reverse @a;
print "@a @b\n";

