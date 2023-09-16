#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use diagnostics;

my $input = <STDIN>; #считываем строку из STDIN
if ($input =~ m(^\+7\s\(\d{3}\)\s\d{3}-\d{2}-\d{2}$))
{
    print "OK";
}
else
{
    print "Not OK";
}