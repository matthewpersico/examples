#!/usr/bin/env perl

use strict;
use warnings;

die "foo bar";

END {
    print "END block executed\n";
}
