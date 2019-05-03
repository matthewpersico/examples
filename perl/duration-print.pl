#!/usr/bin/env perl

use strict;
use warnings;

my $diff  = $ARGV[0];
my $sec   = $diff % 60;
my $min   = int( $diff / 60 ) % 60;
my $hours = int( $diff / 3600 ) % 24;
my $days  = int( $diff / ( 3600 * 24 ) );

printf( "%s%02d:%02d:%02d\n", ( $days ? "${days}d " : "" ), $hours, $min,
    $sec );
