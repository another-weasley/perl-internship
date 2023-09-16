#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

sub parse_url
{
    my ($url) = @_;
    if ($url =~ m/^(?:(?<schema>\w+)(?:\:\/\/))?
    (?<domain>\w+\.\w+)
    (?:\:(?<port>\d+))?
    (?<path>\/[a-zA-Z\_\/]*)?
    (?:\?(?<query_string>[\w\=\&]+))?
    (?:\#(?<anchor>[\w_]+))?$/x)
    {
        return %+;
    }
    else
    {
        return "done";
    }
}


my @aurl=('https://mail.ru',
          'http://www.mail.ru/r/t/p',
          'http://mail.ru/index.html',
          'http://mail.ru/r/t/query.aspx?s=1&p=2',
          'http://mail.ru:8080/r/t/p#res?s=10',
          'http://www.mail.ru/r/t/index.html#res',
          'ftp://user:passwd@90.90.90.90:20/upload/user',
          'http://user@mail.ru:8080/r/t/p?s=10&g=100#res',
          'https://stepik.org/lesson/54194/step/5?unit=32243',
          'https://web-stage.metacpan.org/pod/distribution/POD2-RU/lib/POD2/RU/perlretut.pod',
          'http:ya.ru',
          'https://example.org//',
          'file://loc%61lhost/',
          'https://example.com/././foo',
          'telnet://user:password@host:23/',
          'mailto:Neuman@BBN-TENEXA',
          'input');

for (@aurl)
{
    parse_url($_);
}