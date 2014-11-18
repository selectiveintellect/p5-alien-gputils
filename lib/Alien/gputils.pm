package Alien::gputils;
use strict;
use warnings;

our $VERSION = '0.01';
$VERSION = eval $VERSION;

use parent 'Alien::Base';

1;

__END__
#### COPYRIGHT: Vikas N Kumar. Selective Intellect LLC. All Rights Reserved
#### AUTHOR: Vikas N Kumar <vikas@cpan.org>
#### DATE: 18th Nov 2014
#### LICENSE: Refer LICENSE file.

=head1 NAME

Alien::gputils

=head1 SYNOPSIS

Alien::gputils is a perl module that enables the installation of the gputils
toolkit for developing code for Microchip PIC microcontrollers.

The source code is taken from L<http://gputils.sourceforge.net>.

=head1 VERSION

0.01

=head1 METHODS

=over

=item B<bin_dir>

This method provides the directory for the binaries that form the package of
gputils such as C<gpasm> and C<gplink> which are needed by their downstream
modules like L<VIC>.

=item B<config>

This method provides the access to configuration information for the library on
the system. More information can be seen in the module
L<Alien::gputils::ConfigData>.

=back

=head1 SEE ALSO

=over

=item C<Alien::gputils::ConfigData>

=back

=head1 AUTHORS

Vikas N Kumar <vikas@cpan.org>

=head1 REPOSITORY

L<https://github.com/vikasnkumar/Alien-gputils.git>

=head1 COPYRIGHT

Copyright (C) 2013-2014. Vikas N Kumar <vikas@cpan.org>. All Rights Reserved.

=head1 LICENSE

This is free software. YOu can redistribute it or modify it under the terms of
Perl itself.

