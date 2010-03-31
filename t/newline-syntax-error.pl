package Foo;
use strict;
use warnings;

use Devel::Declare ();
use Devel::Declare::Context::Simple;

sub parse {
    my $ctx = Devel::Declare::Context::Simple->new;
    $ctx->init(@_);

    while (1) {
        $ctx->skipspace;

        if (substr($ctx->get_linestr, $ctx->offset, 1) eq '}') {

            last;
        }

        $ctx->inc_offset(1);
    }

    return $ctx->shadow(sub (&) { warn "handled = @_" });
}

sub markup (&) { warn "original = @_" }

BEGIN {
    Devel::Declare->setup_for(__PACKAGE__, { markup => { const => \&parse } });
}

markup {
    23
};

1;
