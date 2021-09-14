#!/usr/bin/env perl

use strict;
use warnings;
use 5.16.3;

sub ram {
    say ($_[0]);
    say "sleeping @{[sleep(2)]}...";
    say "recording ram usage:";
    say qx(top -b -n 1 | grep $$);
}

sub func {
    ram("in the func");

    my $assign = $_[0];
    ram("just assigned " . '$_[0]' . " (length=@{[length($_[0])]}) to a var");

    my $assign_length = length($assign);
    ram( "just took the length ($assign_length) of the var (read operation)");

    $assign .= 'hahaha';
    ram("just appended to the var (write operation)");
}

my $factor=10_000;

while ($factor < 100_000_001) {
    say "*** working with a $factor length string...";
    my $bas = 'a' x $factor;
    ram("before func");
    func ( $bas );
    ram("after func");
    $factor *= 10;
}
