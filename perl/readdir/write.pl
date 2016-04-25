#!/usr/bin/env perl

use strict;
use warnings;

my $i=0;
while ($i < 30) {
    my $file = "$ARGV[0]/touched.$i";
    qx(touch $file);
    print "touched $file\n";
    $i++;
    sleep 3;
}
