#!/usr/bin/env perl

use strict;

my $x=0;
if( $x = 14 ) {
    print "Assignment executed before use warnings, line " .  __LINE__ . "\n";
}
use warnings;
if( $x = 14 ) {
    print "Assignment executed after use warnings, line @{[__LINE__]}\n";
}

if ($x = is_even(14)) {
    print "even\n";
}

sub is_even {
    return ! ($_[0] %2);
}
