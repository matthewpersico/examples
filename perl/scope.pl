#!/usr/bin/env perl

# no strict/warnings

our $i = 42;

print("outside before loop \$i = $i\n");

for $i ( 0 .. 5 ) {
    print("inside loop \$i = $i\n");
}

print("outside after loop \$i = $i\n");
