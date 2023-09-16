#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

my @strs = ();
my %counter;
while (<STDIN>)
{
    $counter{$_}++;
    if ($counter{$_} == 1)
    {
        push(@strs, $_);
    }
}
open(my $file, '>', '/tmp/uniq.txt') or die "$!";
for (@strs)
{
    my $l = length($_);
    my $writing = "$counter{$_} $l $_";
    print $file $writing;
}
close($file);
