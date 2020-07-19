#!/usr/bin/env perl

use strict;
use warnings;

my $eithiopian = (defined($ARGV[0]) && $ARGV[0] eq '--ethiopian');
if ( ! $eithiopian ) {
    BEGIN { print("Put on socks, "); }
    END   { print("Take off socks, "); }
    BEGIN { print("Put on shoes, "); }
    END   { print("Take off shoes, "); }
}

print("Run a marathon, ");
