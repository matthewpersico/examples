package Foo::New;

use strict;
use warnings;
use 5.16.3;

use Data::Dumper;

sub a_function {
    print Data::Dumper->Dump([*Foo::New],[qw(*foo-new-typeglob)]);
}

1;
