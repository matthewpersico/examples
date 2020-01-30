#!/usr/bin/env perl

use strict;
use warnings;

our $ourvar_inited = 'ourvar_inited set at declaration';
my $myvar_inited = 'myvar_inited set at declaration';

our $ourvar_uninited;
my $myvar_uninited;

BEGIN {
    $ourvar_inited = 'ourvar_inited set in BEGIN';
    $myvar_inited = 'myvar_inited set in BEGIN';
    $ourvar_uninited = 'ourvar_uninited set in BEGIN';
    $myvar_uninited = 'myvar_uninited set in BEGIN';
}

print("
\$ourvar_inited = '$ourvar_inited'
\$myvar_inited = '$myvar_inited'
\$ourvar_uninited = '$ourvar_uninited'
\$myvar_uninited = '$myvar_uninited'
");
