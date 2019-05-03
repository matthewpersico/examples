#!/usr/bin/env perl

use strict;
use warnings;

## do with args does not work
#print "Doing dothing.pl with arguments 'foo' and 'bar':\n";
#do "./dothing.pl foo bar";
print(
    join(
        "\n", '--- In master.pl ---', 'INC = ', @INC, 'Doing dothing.pl', ''
    )
);
$ENV{PERL5LIB} = '/tmp'
  . (
    $ENV{PERL5LIB}
    ? ":$ENV{PERL5LIB}"
    : ''
  );
do "./dothing.pl";
print `cat dothing.log`;
print '--- End master.pl ---', qq(\n);
