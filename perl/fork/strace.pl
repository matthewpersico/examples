sub _r {
    # While using this test to debug the addition of the monitor process in
    # BuildDeb::SubProcess, getting an strace of the child process and it's
    # family was invaluable. I am purposely leaving the code here for future
    # reference. Set $do_strace=1 if you want straces.
    my $do_strace = 0;
    my $pid       = fork();
    if ( !$pid ) {
        open STDERR, '>&', $errlog;
        exec @_
          or die "@_: $!";
    } else {
        my $strace;
        if ( $do_strace == 1 && $rorder == 3 ) {
            $strace = fork();
            if ( !$strace ) {
                diag("******* starting strace *******");
                diag(
"strace  -o /tmp/$pid.strace.${strace_master} -s 512 -ttt -f -p $pid "
                );
                exec( 'strace', '-o', "/tmp/$pid.strace.${strace_master}",
                    '-s', '512', '-ttt', '-f', '-p', "$pid" )
                  or die "cannot exec strace: $!";
            }
        }
        $rorder++;
        waitpid $pid, 0;
        my $status = $?;
        if ($strace) {
            waitpid $strace, 0;
            diag(qx(cp -f $errlog_file /tmp/$pid.output.${strace_master}));
        }
        return $status;
    }
}
