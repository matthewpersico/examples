#!/usr/bin/env perl

use strict;
use warnings;

package Dummy::Pack;

sub printme {
    print('At __LINE__=' . __LINE__.
            ' in __FILE__=' . __FILE__ .
            ' __PACKAGE__=' . __PACKAGE__ .
            ' $0=' . $0 .
            qq(\n));
}

1;

package main;

print('At __LINE__=' . __LINE__.
        ' in __FILE__=' . __FILE__ .
        ' __PACKAGE__=' . __PACKAGE__ .
        ' $0=' . $0 .
        qq(\n));
Dummy::Pack::printme();
