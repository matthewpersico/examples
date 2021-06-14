#!/usr/bin/env perl

use 5.16.3;

use Cwd;
use File::Temp qw(tempfile tempdir);

use BuildDeb::SubProcess;

my ($fh, $fn) = tempfile();

my @args = (getcwd . '/child.pl',
            $fn);

my $gensymv = BuildDeb::SubProcess->new(
    @args,
    {
        stdin             => undef,
        stdout            => \*STDOUT,
        stderr_dup_stdout => 1,
    }
);

my $gensymv_pid        = $gensymv->pid;
my $gensymv_terminated = 0;
while ( not $gensymv_terminated ) {
    my $ret = $gensymv->wait( { nohang => 1 } );
    if ( $ret == 1 ) {
        # it finished.
        $gensymv_terminated = 1;
    } else {
        sleep 1;
    }
}

my @info = <$fh>;
close $fh;
print @info;
