#!/usr/bin/env perl

use strict;
use warnings;

my $ppid = getppid;
my $null = chr(0);
print join(' ',split(/$null/,qx(cat /proc/$ppid/cmdline)));
