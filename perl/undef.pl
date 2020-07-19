#!/usr/env/bin perl

use strict;
use warnings;
use v5.16;

my $int;
say("\$int before assignment at line " . __LINE__ . ": $int");
$int++;
say("\$int after assignment at line " . __LINE__ . ": $int");

my $str;
say("\$str before assignment at line " . __LINE__ . ": $str");
$str .= 'hello world';
say("\$str after assignment at line " . __LINE__ . ": $str");

my $str2='';
say("\$str2 before operation at line " . __LINE__ . ": $str2");
$str2++;
say("\$str2 after operation at line " . __LINE__ . ": $str2");

my $str3='a';
say("\$str3 before operation at line " . __LINE__ . ": $str3");
$str3++;
say("\$str3 after operation at line " . __LINE__ . ": $str3");

my $str4='z';
say("\$str4 before operation at line " . __LINE__ . ": $str4");
$str4++;
say("\$str4 after operation at line " . __LINE__ . ": $str4");

my $str5='Z';
say("\$str5 before operation at line " . __LINE__ . ": $str5");
$str5++;
say("\$str5 after operation at line " . __LINE__ . ": $str5");

for my $ord (0..255) {
    my $char=(chr($ord));
    say("\$char ($char) ++ = " . ++$char);
}

my $queue_size = {};
say("\$queue_size->{ 'large' } before operation at line " . __LINE__ . ": $queue_size->{ 'large' }");
$queue_size->{ 'large' }++;
say("\$queue_size->{ 'large' } after operation at line " . __LINE__ . ": $queue_size->{ 'large' }");
