#!/usr/bin/env perl

use strict;
use warnings;

eval { die "foo bar"; };

if ($@) {
    if ( $ARGV[0] ) {
        print "die dollar under\n";
        die $@;
    } else {
        print "die\n";
        die;
    }
}

END {
    print "END block executed\n";
}
