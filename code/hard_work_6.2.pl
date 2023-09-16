use strict;
use warnings;
use POSIX ":sys_wait_h";

sub hard_work
{
    my ($n) = @_;
    return(sqrt($n));
}

use strict;
use warnings;

my @output = ();
my (%r, %w);

while (my $input = <STDIN>)
{
    pipe($r{$input}, $w{$input}) or die "Ошибка при создании pipe: $!";
    if (my $pid = fork())
    {
        close($w{$input});
        for my $key (keys %r)
        {
            my $pipe_rc = $r{$key};
            push @output, <$pipe_rc>;
            close($r{$key});
            close($pipe_rc);
        }
    }
    else
    {
        die "Cannot for $!" unless defined($pid);
        my $pipe_wc = $w{$input};
        print $pipe_wc hard_work($input);
        close($pipe_wc);
        close($w{$input});
        close($r{$input});
        exit;
    }
}

print join("\n", sort(@output));


