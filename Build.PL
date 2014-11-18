use strict;
use warnings;
use Alien::Base::ModuleBuild;

print $Alien::Base::ModuleBuild::VERSION, "\n";
$Alien::Base::ModuleBuild::Verbose = 1;

my %win32 = ('Alien::MSYS' => 0);
my $build = Alien::Base::ModuleBuild->new(
    module_name => 'Alien::gputils',
    license => 'apache',
    dist_author => 'Vikas N. Kumar <vikas@cpan.org>',
    dist_abstract => 'Alien module for gputils from http://gputils.sourceforge.net',
    create_readme => 0,
    configure_requires => {
        'Module::Build' => 0,
        'Alien::Base' => 0,
        'Alien::Base::ModuleBuild' => 0,
    },
    build_requires => {
        'Alien::Base::ModuleBuild' => 0,
        'Test::More' => 0,
        'Module::Build' => 0,
    },
    requires => {
        'perl' => '5.10.0',
        'File::Spec' => 0,
        'Alien::Base' => 0,
        %win32,
    },
    alien_name => 'gputils',
    alien_repository => {
        protocol => 'http',
        host => 'downloads.sourceforge.net',
        location => '/project/gputils/gputils/1.4.0/',
        pattern => qr/^gputils-([\d\.\-]+).tar.gz$/,
    },
    alien_build_commands => [
        '%c --prefix=%s',
        'make',
        'make check'
    ],
    alien_install_commands => [
        'make install'
    ],
    meta_merge => {
        resources => {
            repository => "https://github.com/selectiveintellect/p5-alien-gputils",
            bugtracker => "https://github.com/selectiveintellect/p5-alien-gputils/issues",
        },
    },
);

$build->create_build_script;
$build->dispatch('distmeta');
$build->dispatch('manifest');

__END__
#### COPYRIGHT: Vikas N Kumar. Selective Intellect LLC. All Rights Reserved
#### AUTHOR: Vikas N Kumar <vikas@cpan.org>
#### DATE: 18th Nov 2014
#### LICENSE: Refer LICENSE file.
http://downloads.sourceforge.net/project/gputils/gputils/1.4.0/gputils-1.4.0-1.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fgputils%2Ffiles%2Fgputils%2F1.4.0%2F&ts=1416325721&use_mirror=hivelocity
