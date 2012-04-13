package App::DPath;
BEGIN {
  $App::DPath::AUTHORITY = 'cpan:SCHWIGON';
}
{
  $App::DPath::VERSION = '0.04';
}
# ABSTRACT: Cmdline tool around Data::DPath

use App::Cmd::Setup -app;

use 5.008; # Data::DPath requires it
use strict;
use warnings;

1;



=pod

=encoding utf-8

=head1 NAME

App::DPath - Cmdline tool around Data::DPath

=head1 SYNOPSIS

This module provides a cmdline tool around Data::DPath.

Query some input data with a DPath to stdout.

Default data format (in and out) is YAML, other formats can be
specified.

  $ dpath '//some/dpath' data.yaml

Use it as filter:

  $ dpath '//some/dpath' < data.yaml > result.yaml
  $ cat data.yaml | dpath '//some/dpath' > result.yaml
  $ cat data.yaml | dpath '//path1' | dpath '//path2' | dpath '//path3'

You can define different input/output formats (yaml, json, xml, ini,
dumper, tap, flat) with C<-i> and C<-o>.

See documentation for the L<dpath|dpath> utility for more.

=head1 DEFAULT COMMAND CHEATING

The C<dpath> tool is based on L<App::Cmd> which is using sub
commands. All the above examples use the default subcommand C<search>
which is silently inserted into the argument/options list if no
subcommand is given.

So instead of

  $ dpath -i json -o dumper data.json

you can also write

  $ dpath search -i json -o dumper data.json

Other available subcommands are C<help> and C<commands>.

The built in help always fully refers to subcommands.

=head1 AUTHOR

Steffen Schwigon <ss5@renormalist.net>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Steffen Schwigon.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__END__

