use Test::More;

BEGIN { use_ok('Alien::gputils'); }

my $alien = new_ok('Alien::gputils');
can_ok($alien, 'bin_dir');
foreach (qw(gpasm gplink gplib gpdasm gpstrip gpvc gpvo)) {
    can_ok($alien, $_);
}
SKIP: {
    skip "non-developer mode", 2 unless $ENV{TEST_GPASM};
    isnt($alien->bin_dir, undef, "has bin_dir()");
    note($alien->bin_dir);
    foreach (qw(gpasm gplink gplib gpdasm gpstrip gpvc gpvo)) {
        isnt($alien->$_, undef);
        note($alien->$_);
    }
}

done_testing();
__END__
#### COPYRIGHT: Vikas N Kumar. Selective Intellect LLC. All Rights Reserved
#### AUTHOR: Vikas N Kumar <vikas@cpan.org>
#### DATE: 18th Nov 2014
#### LICENSE: Refer LICENSE file.
