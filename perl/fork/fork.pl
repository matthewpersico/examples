#!/usr/bin/env perl

use strict;
use warnings;

my $pid = fork();
         if (!$pid) {
             exec @ARGV
                or die "@ARGV: $!";
          } else {
            print "I am the parent waiting for child $pid...\n";
             waitpid $pid, 0;
             print "Child $pid exited $?\n";
          }

