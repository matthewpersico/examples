#!/usr/bin/env perl

use strict;
use warnings;

opendir my $dir, $ARGV[0];

while (my $file = readdir($dir)) {
    print "$ARGV[0]/$file exists\n";
    sleep 5;
}
