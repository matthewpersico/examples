#!/usr/bin/env perl

use strict;
use warnings;
use 5.16.3;
use FindBin qw($RealBin);
use lib "$RealBin/.";

use Foo;
use Foo::NotAFoo;
use IsAFoo;

Foo->foofunc('Foo->foofunc()');
Foo::NotAFoo->notafoofunc('Foo::NotAFoo->notafoofunc()');
IsAFoo->isafoofunc('IsAFoo->isafoofunc()');
IsAFoo->foofunc('IsAFoo->foofunc()');
Bar->foofunc('Foo->foofunc()');
