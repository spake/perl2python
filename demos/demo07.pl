#!/usr/bin/perl -w

# takes in lines of input of the form
# <name> <score>
# sums up scores, determines winner(s)

%scores = ();

while ($line = <>) {
	$line =~ /^([^ ]+) (\d+)$/;
	$name = $1;
	$score = $2;

	$scores{$name} += $score;
}

# find winner
$max_score = -1;
@max_names = ();

foreach $name (keys %scores) {
	$score = $scores{$name};
	if ($score > $max_score) {
		# new high score
		$max_score = $score;
		@max_names = ($name);
	} elsif ($score == $max_score) {
		# draw
		push @max_names, $name;
	}
}

if (@max_names == 1) {
	print "Winner is ";
} else {
	print "Winners are ";
}
print join ", ", @max_names;
print " with $max_score points\n";