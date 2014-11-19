use strict;
use warnings;
use Alien::Base::ModuleBuild;

die 'No support for OS' if $^O =~ /mswin32|cygwin/i;
$Alien::Base::ModuleBuild::Verbose = 1;

my %win32 = ();
%win32 = ('Alien::MSYS' => 0) if $^O =~ /Win32/i;
my $alien_msys = 1 if $^O =~ /Win32/i;
my $class = Alien::Base::ModuleBuild->subclass(
    class => 'Alien::gputils::ModuleBuild',
    code => q {
        use File::Spec;
        use File::Which qw(which);
        use Capture::Tiny qw(capture_merged);
        sub alien_check_installed_version {
            my $self = shift;
            my $output = capture_merged {
                `gpasm -v`;
            };
            print STDERR "Got gpasm version: $output" if $output;
            if ($output =~ /gpasm-(\d+)\.(\d+)\.(\d+)/) {
                my $ver = sprintf "%d.%d.%d", $1, $2, $3;
                print STDERR "Found gputils VERSION: $ver\n";
                # find the path where it is found
                my $path = which('gpasm');
                my @dirs = File::Spec->splitpath($path);
                pop @dirs;
                $path = File::Spec->catdir(@dirs);
                print STDERR "Found gputils installed in $path\n" if $path;
                return unless $1 > 0;
                return unless $2 > 2;
                $self->config_data(gputils_system_path => $path) if defined $path;
                return $ver;
            }
            return;
        }
    }
);
my $build = $class->new(
    module_name => 'Alien::gputils',
    license => 'apache',
    dist_author => 'Vikas N. Kumar <vikas@cpan.org>',
    dist_abstract => 'Alien module for gputils from http://gputils.sourceforge.net',
    create_readme => 0,
    configure_requires => {
        'Module::Build' => 0,
        'Alien::Base' => '0.006',
        'Alien::Base::ModuleBuild' => '0.006',
        'Capture::Tiny' => 0,
    },
    build_requires => {
        'Alien::Base::ModuleBuild' => '0.006',
        'Test::More' => 0,
        'Module::Build' => 0,
        'Capture::Tiny' => 0,
    },
    requires => {
        'perl' => '5.10.0',
        'File::Spec' => 0,
        'File::Which' => 0,
        'Alien::Base' => 0,
        %win32,
    },
    alien_name => 'gputils',
    alien_repository => {
        protocol => 'http',
        host => 'downloads.sourceforge.net',
        location => '/project/gputils/gputils/1.4.0/',
        exact_filename => 'gputils-1.4.0-1.tar.gz',
        exact_version => '1.4.0',
        c_compiler_required => 1,
    },
    alien_build_commands => [
        '%c --disable-html-doc --without-mplabx-path --prefix=%s',
        'make',
        'make check'
    ],
    alien_install_commands => [
        'make install'
    ],
    alien_msys => $alien_msys,
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
