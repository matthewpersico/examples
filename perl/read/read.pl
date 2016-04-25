#!/usr/bin/env perl

use strict;
use warnings;

open(IH, '<', 'one-line-file') or die "$!";
my $data = <IH>;
close(IH);
print $data;

open(IH, '<', 'two-line-file') or die "$!";
$data = <IH>;
close(IH);

print $data;
