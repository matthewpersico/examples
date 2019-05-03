#!/usr/bin/env perl

use strict;
use warnings;

my $inter = 0;
$SIG{TERM} = sub {
    print "Booyah!\n";
    $inter = 1;
    $SIG{TERM} = "IGNORE";
};

print "$$\n";
while ( !$inter ) {
    print qx(date);
    sleep 1;
    my $i = 0;
    while ( $i++ < 1_000_000 ) {
        print "$i - sim stall in $$:" . qx(date);
    }
}
