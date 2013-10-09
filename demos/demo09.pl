#!/usr/bin/perl -w

# gets the weather in penrith

$url = "http://www.bom.gov.au/nsw/forecasts/penrith.shtml";

open BOM, "wget -q -O- $url |";

while ($line = <BOM>) {
	if ($line =~ /Max <em class="max">([0-9]+)<\/em>/) {
		print "It will be $1 degrees tomorrow\n";
		last;
	}
}