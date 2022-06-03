use 5.16.3;
use warnings;

use Log::Log4perl qw(:easy);

Log::Log4perl->easy_init($WARN);

DEBUG "This doesn't go anywhere";
ERROR "This gets logged";

my $logger = Log::Log4perl->get_logger();

$logger->debug("This doesn't go anywhere");
$logger->error("This gets logged");
eval { $logger->logdie("This is logdie without a newline") };
eval { $logger->logdie("This is logdie with a newline\n") };
say('---');

$logger->warn("This is warn without a newline");
say('---');

$logger->warn("This is warn with a newline\n");
say('---');

$logger->warn("This is warn with two newlines\n\n");
say('---');

my @stderr = (
    "line 1 stderr without nl",
    "line 2 stderr without nl",
    "line 3 stderr without nl",
);

$logger->warn( "stderr, no join, no newline", @stderr );
say('---');
$logger->warn( join( "\n", "stderr, join, no newline", @stderr ) );
say('---');
$logger->warn( join( "\n", "stderr, join, newline", @stderr, "", "" ) );
say('---');

say
"******* Net-net, logger->warn() and error() do not need new lines to prevent code location printing";
