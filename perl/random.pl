#!/usr/bin/env perl

use strict;
use warnings;

my @array1 = qw ( a b c d e f g);
my @array2 = qw ( 0 1 2 3 4 5 6 7 8 9 10 );

print(int(rand 2)
        ? $array1[int(rand(scalar(@array1)))]
        : $array2[int(rand(scalar(@array2)))],
      "\n");

print(int(rand 2)
        ? $array1[int(rand(@array1))]
        : $array2[int(rand(@array2))],
      "\n");

print((@array1,@array2)[int(rand(@array1+@array2))],
      "\n");
