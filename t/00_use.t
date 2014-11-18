use Test::More;

BEGIN { use_ok('Alien::gputils'); }

my $alien = new_ok('Alien::gputils');
can_ok($alien, 'cflags');
isnt($alien->cflags, undef, "has cflags()");
note($alien->cflags);
can_ok($alien, 'libs');
isnt($alien->libs, undef, "has libs()");
note($alien->libs);
isnt($alien->bin_dir, undef, "has bin_dir()");
note($alien->bin_dir);

done_testing();
__END__
#### COPYRIGHT: Vikas N Kumar. Selective Intellect LLC. All Rights Reserved
#### AUTHOR: Vikas N Kumar <vikas@cpan.org>
#### DATE: 18th Nov 2014
#### LICENSE: Refer LICENSE file.
