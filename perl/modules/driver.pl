#!/usr/bin/env perl

use strict;
use warnings;
use 5.16.3;
use lib '.';

use Foo;
use Foo::NotAFoo;
use IsAFoo;

Foo->foofunc('Foo->foofunc()');
Foo::NotAFoo->notafoofunc('Foo::NotAFoo->notafoofunc()');
IsAFoo->isafoofunc('IsAFoo->isafoofunc()');
IsAFoo->foofunc('IsAFoo->foofunc()');
