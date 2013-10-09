#!/usr/bin/perl -w

# array_test.pl

@a = ("a", "b", "c", "d", "e");
@b = (1, 2, 3, 4, 5);
@c = ();

# test printing
print @a, "\n";
print @b, "\n";
print @c, "\n";
print "@a\n";
print "@b\n";
print "@c\n";

# test length stuff
print @a+0, "\n";
print @b+0, "\n";
print @c+0, "\n";
print $#a, "\n";
print $#b, "\n";
print $#c, "\n";
print "$#a\n";
print "$#b\n";
print "$#c\n";

# test sorting
@a = sort @a;
@b = sort @b;
@c = sort @c;
print "@a\n";
print "@b\n";
print "@c\n";

# strings with floats should definitely work as array indices.
@things = ("0", 1, "2.0", 3.0, "4.", 5.);

foreach $a (@things) {
    foreach $b (@things) {
        print int($things[$a] + $things[$b]), " ";
    }
    print "\n";
}