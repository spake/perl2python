#!/usr/bin/perl -w

@a = ("a", "b", "c", "d", "e");

# test printing
print @a, "\n";
print "@a\n";

# test length stuff
print @a+0, "\n";
print $#a, "\n";
print "$#a\n";

# test push/pop
push @a, "x";
push @a, "y";
print pop @a;
print pop @a;
print "\n";

# test shift/unshift
unshift @a, "x";
unshift @a, "y";
print shift @a;
print shift @a;
print "\n";

# test reverse
@a = reverse @a;
print "@a\n";

# test sorting
@a = sort @a;
print "@a\n";