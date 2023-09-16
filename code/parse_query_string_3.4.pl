#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

sub parse_query_string
{
    my ($query_string) = @_;
    my %result;
    while ($query_string =~ m/(?<key>[^\&\=]+)?(?:[\=]+)(?<value>[^\&\=]+)?(?:\#.+)?/g)
    {
        $result{$1} = $2;
    }
    my $href = \%result;
    return $href;
}

my $hashref = parse_query_string("key1=value1&key2=value2");
print join(" ", %$hashref);