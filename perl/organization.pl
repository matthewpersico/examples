#!/usr/bin/env perl

use strict;
use warnings;
use 5.16.3;

main();

sub before {
    say "This is before(), $varbefore, $varafter";
}

my $varbefore = "varbefore";

sub main {
    say "This is main().";
    before();
    after();
}

my $varafter = "varafter";

sub after {
    say "This is after()";
}

#main();
