package Foo;

use strict;
use warnings;
use 5.16.3;

use Data::Dumper;
use lib '.';
use Foo::Orig;
use Foo::New;

sub a_function {
    if ( $ENV{FOO_NEW} ) {
        return Foo::New::a_function(@_);
    }
    return Foo::Orig::a_function(@_);
}
1;
