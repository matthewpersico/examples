#!/usr/bin/env perl

use strict;
use warnings;

unlink "dothing.log";
open OH, ">dothing.log" or die "$!";
print OH join( qq(\n),
    '--- In dothing.pl ---',
    "at @{[scalar(localtime())]}",
    "arguments:", "@ARGV", 'INC', @INC, '--- END dothing.pl ---', '' );
close OH;
