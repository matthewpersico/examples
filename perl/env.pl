use strict;
use warnings;

$ENV{OOGA} = 'chacka';

system(q(env | grep chacka));

system(q(env | grep PERL5LIB));

$ENV{PERL5LIB} = '';
