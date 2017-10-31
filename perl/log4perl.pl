use strict;
use warnings;

use Log::Log4perl qw(:easy);

Log::Log4perl->easy_init($ERROR);

DEBUG "This doesn't go anywhere";
ERROR "This gets logged";

my $logger = Log::Log4perl->get_logger();

$logger->debug( "This doesn't go anywhere" );
$logger->error( "This gets logged" );
$logger->logdie( "This is die\n" );
