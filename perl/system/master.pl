#!/usr/bin/env perl

use strict;
use warnings;

print(
    join( "\n",
        '--- In master.pl ---',
        'INC = ', @INC, 'System systemthing.pl foo bar', '' )
);
$ENV{PERL5LIB} = '/tmp'
  . (
    $ENV{PERL5LIB}
    ? ":$ENV{PERL5LIB}"
    : ''
  );
system("./systemthing.pl foo bar");
print `cat systemthing.log`;
print '--- End master.pl ---', qq(\n);
