#!/usr/bin/perl -w

$a = 3;
$b = 5;
$c = 7;
$d = $a + $b;
$e = $d - $c;
$f = $e * $a;
$g = $f / $e;
$h = $g ** $a;
$i = $h % $c;

print "$a $b $c $d $e $f $g $h $i\n";
# 3 5 7 8 1 3 3 27 6

if ($f == $g) {
    if ($i < $h) {
        if ($d > $e) {
            if ($a <= $g) {
                if ($a >= $f) {
                    if ($a != $i) {
                        print "you win!\n";
                    }
                }
            }
        }
    }
}

if (($f == $g) && ($i < $h) && ($d > $e || ($a <= $g && !($a < $f))) && $a != $i) {
    print "you win again!\n";
}

if (($f == $g) and ($i < $h) and ($d > $e or ($a <= $g and not ($a < $f))) and $a != $i) {
    print "ultimate winrar\n";
}

$a = 29;
$b = $a >> 2;
$c = $b << 2;
$d = $a ^ $b;
$e = $a & $d;
$f = $b | $e;
$g = ~$e;
print "$a $b $c $d $e $f\n";
# 29 7 28 26 24 31 18446744073709551591
# $g may not be architecture independent though

# reassignment operators
$a = 42;
$a += 8;
$a -= 10;
$a *= 5;
$a /= 8;
$a %= 13;
$a >>= 2;
$a <<= 1;
$a **= 2;
$a ^= 42;
$a |= 5;
$a &= 200;
print "$a\n";

# increment/decrement
$a = 100;
$a++;
$a++;
$a--;
$a--;
$a++;
print "$a\n";

# reassignment for new variable (one that hasn't been mentioned before)
$x += 10;
$y -= 5;
print "$x $y\n";

# increment/decrement for new variable
$u++;
$v--;
print "$u $v\n";

# reassignment and increment/decrement on strings
$a = "5";
$b = "7";
$c = "11";
$a *= 5;
$b -= -10;
$c++;
print "$a $b $c\n";

# who could forget string concatenation?
$a = "hello";
$b = "world";
$c = $a . $b;
$d = $c . 6;
$e = $a . $b . $c . $d . $e;
$e .= 6*7;
$e = 0 . $e;
print "$e\n";