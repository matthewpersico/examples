#!/usr/bin/env perl

use strict;
use warnings;
use 5.16.3;

if (! exists( $ENV{TEST_ENVVAR} ) ) {
    say '$ENV{TEST_ENVVAR} does not exist in perl';
    exit;
}
if (! defined( $ENV{TEST_ENVVAR} ) ) {
    say '$ENV{TEST_ENVVAR} is not defined perl';
    exit;
}

say '$ENV{TEST_ENVVAR} has value [' .
    $ENV{TEST_ENVVAR} . '] in perl';
