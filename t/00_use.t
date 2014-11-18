use Test::More;

BEGIN { use_ok('Alien::gputils'); }

my $alien = new_ok('Alien::gputils');
can_ok($alien, 'bin_dir');
SKIP: {
    skip "non-developer mode", 2 unless $ENV{TEST_GPASM};
    isnt($alien->bin_dir, undef, "has bin_dir()");
    note($alien->bin_dir);
}

done_testing();
__END__
#### COPYRIGHT: Vikas N Kumar. Selective Intellect LLC. All Rights Reserved
#### AUTHOR: Vikas N Kumar <vikas@cpan.org>
#### DATE: 18th Nov 2014
#### LICENSE: Refer LICENSE file.
