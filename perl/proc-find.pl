# https://bbgithub.dev.bloomberg.com/robosvn/cstools/blob/0057af137ade25fc28cd0b2a4987437b99696a87/lib/perl/Util/Message.pm#L614-L649
sub get_proc_parent {
    my $ppid    = getppid;
    my $cmdline = 'N/A';
    if ( $^O eq 'linux' ) {
        # cmdline contains the command that started process with pid $ppid,
        # arguments separated by the NULL character. We split on the NULL
        # character (/\0/) and take the first entry in the list.
        if ( open my $cmdline_fh, '<', "/proc/$ppid/cmdline" ) {
            local $/ = undef;
            $cmdline = ( split( /\0/, <$cmdline_fh> ) )[0];
        }
    } else {
        my $proc =
            $^O eq 'aix'     ? '/usr/bin/proctree'
          : $^O eq 'solaris' ? '/usr/bin/ptree'
          :                    '';
        if ( $proc && -e $proc && open( IH, "-|", "$proc $ppid" ) ) {
            while (<IH>) {
                $_ =~ s/^\s+//;
                my @d = split( /\s+/, $_ );
                if ( $d[0] == $ppid ) {
                    $cmdline = $d[1];
                    close(IH);
                }
            }
        }
    }
    return $cmdline;
}
