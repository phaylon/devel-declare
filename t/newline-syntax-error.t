use strict;
use warnings;

use FindBin;
use Test::More tests => 1;

my $result = eval {
    require "$FindBin::Bin/newline-syntax-error.pl";
    1;
};

ok $result, 'newline syntax did compile and not throw a syntax error'
    or note "Error was $@";

