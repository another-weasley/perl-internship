#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

sub intersection {
    my ($set1, $set2) = @_;
    my %values1 = %$set1;
    my %values2 = %$set2;
    for my $key (keys(%values1))
    {
        if (!exists($values2{$key})) { delete($values1{$key}); }
    }
    return \%values1;
}

intersection({key1 => "value1", key2 => "value2"}, {key1 => "value1"});
alternative_intersection(key1 => "value1", key2 => "value2"}, {key1 => "value1"});