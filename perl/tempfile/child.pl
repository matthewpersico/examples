#!/usr/bin/env perl

use 5.16.3;

open my $oh, '>', $ARGV[0] or die "Cannot open $ARGV[0] for write: $!\n";

$oh->print( "MOVE 2398346542\n");

$oh->close();
