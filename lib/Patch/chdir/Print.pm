package Patch::chdir::Print;

# DATE
# VERSION

use strict 'subs', 'vars';
use warnings;

sub import {
    my $pkg = shift;

    my $caller = caller();
    *{"$caller\::chdir"} = sub {
        warn "chdir($_[0])";
        CORE::chdir(@_);
    };
}

sub unimport {
    my $pkg = shift;

    my $caller = caller();
    # XXX find a better way to restore original chdir
    *{"$caller\::chdir"} = sub {
        CORE::chdir(@_);
    };
}

1;
# ABSTRACT: Wrap chdir() to print the argument first

=head1 SYNOPSIS

 % perl -MPatch::chdir::Print -e'...'


=head1 DESCRIPTION
