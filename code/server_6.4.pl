#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use IO::Socket;

my $server = IO::Socket::INET->new(
    LocalPort => 8080,
    Type      => SOCK_STREAM,
    ReuseAddr => 1,
    Listen    => 10)
    or die "Can't create server on port 8081 : $@ $/";

LABEL: while (1)
{
    my $client = $server->accept();
    $client->autoflush(1);
    while (my $message = <$client>)
    {
        chomp($message);
        last LABEL if $message eq 'exit';
        print "$message\n";
    }
    close($client);
}
close($server);
