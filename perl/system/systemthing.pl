#!/usr/bin/env perl

use strict;
use warnings;

unlink "systemthing.log";
open OH, ">systemthing.log" or die "$!";
print OH join( qq(\n),
    '--- In systemthing.pl ---',
    "at @{[scalar(localtime())]}",
    "arguments:", "@ARGV", 'INC', @INC, '--- END systemthing.pl ---', '' );
close OH;
