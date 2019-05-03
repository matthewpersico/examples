#!/usr/bin/env perl

use strict;
use warnings;

my @output;

for my $i (qw (3 4 5 10)) {
    @output = ( 0, 1, 2, 3 );
    print "\@output = @output\n";

    if ( $i <= scalar(@output) ) {
        @output = @output[ $i * -1 .. -1 ];
        print "\@output[$i * -1 .. -1] = @output\n";
    }
}
