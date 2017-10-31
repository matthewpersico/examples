#!/usr/bin/env/ perl

use strict;
use warnings;

sub x {
    my @c = caller(0);
    print "@c\n";
}

x();
