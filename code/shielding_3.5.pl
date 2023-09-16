#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

my $string = <STDIN>;
$string =~ s{([\\ \{ \} \[ \] \( \) \^ \$ \. \| \* \+ \? \\])}{\\$1}xg;
print $string, "\n";