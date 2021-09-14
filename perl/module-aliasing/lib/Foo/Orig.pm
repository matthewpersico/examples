package Foo::Orig;

use strict;
use warnings;
use 5.16.3;

use Data::Dumper;

sub a_function {
    print Data::Dumper->Dump([*Foo::Orig],[qw(*foo-new-typeglob)]);
}

1;
