#!/usr/bin/env bash

set -x

perl ./driver.pl

FOO_NEW='' perl ./driver.pl

FOO_NEW='0' perl ./driver.pl

FOO_NEW='1' perl ./driver.pl
