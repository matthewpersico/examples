#!/usr/bin/env perl

use strict;
use warnings;

system('env', 'FOO=bar', './env.echo');

$ENV{FOO} = q(yomama);
system('./env.echo');

delete $ENV{FOO};
system('./env.echo');
