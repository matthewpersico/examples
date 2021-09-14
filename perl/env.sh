#!/usr/bin/env bash

cat <<'EOPERL' > env-test.pl
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
EOPERL
chmod +x env-test.pl

echo '*** exists ***'
echo 'TEST_ENVVAR does not exist in shell:'
env | grep -E ^TEST_ENVVAR
./env-test.pl
echo

echo '*** defined ***'
echo '$ TEST_ENVVAR='
TEST_ENVVAR=
export TEST_ENVVAR
echo 'TEST_ENVVAR is not defined in shell:'
env | grep -E ^TEST_ENVVAR
./env-test.pl
echo

echo '*** assigned ***'
echo '$ TEST_ENVVAR=42'
TEST_ENVVAR=42
echo "TEST_ENVVAR has value [42] in shell:"
env | grep -E ^TEST_ENVVAR
./env-test.pl
