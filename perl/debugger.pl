#!/usr/bin/env perl

use strict;
use warnings;

sub am_i_debugging {
    defined(&DB::DB) || 0;
}

sub the_debuggers_are {
    return '-d:ptkdb'
      if(exists $INC{'Devel/ptkdb.pm'});
    return '-d'
      if(exists $INC{'perl5db.pl'});
    ## Add support for others here.
    return '-d:unknown'
      if(am_i_debugging());
    return '';
}

my $d=6;
print( join("\n",
            am_i_debugging(),
            the_debugger_is(),
            ''));
my $e = 6;
