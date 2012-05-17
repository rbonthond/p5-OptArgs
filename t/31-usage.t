use strict;
use warnings;

package x;
use Test::More;
use Test::Fatal;
use OptArgs;

opt dry_run => (
    isa     => 'Bool',
    comment => 'do nothing',
);

opt quiet => (
    isa     => 'Bool',
    comment => 'be quiet about it',
);

arg target => (
    isa      => 'Str',
    comment  => 'name of the database to deploy',
    required => 1,
);

is usage, 'usage: 31-usage.t [options] TARGET

    --dry-run         do nothing
    --quiet           be quiet about it

    TARGET            name of the database to deploy

', 'plain usage';

is exception { optargs }, 'usage: 31-usage.t [options] TARGET

    --dry-run         do nothing
    --quiet           be quiet about it

    TARGET            name of the database to deploy

', 'missing usage';

package y;
use Test::More;
use Test::Fatal;
use OptArgs;

opt quiet => (
    isa     => 'Bool',
    comment => 'be quiet about it',
);

opt dry_run => (
    isa     => 'Bool',
    comment => 'do nothing',
);

arg target => (
    isa      => 'Str',
    comment  => 'name of the database to deploy',
    required => 1,
);

is exception { optargs }, 'usage: 31-usage.t [options] TARGET

    --quiet           be quiet about it
    --dry-run         do nothing

    TARGET            name of the database to deploy

', 'usage';

package z;
use Test::More;
use Test::Fatal;
use OptArgs;

opt quiet => (
    isa     => 'Bool',
    comment => 'be quiet about it',
);

arg target => (
    isa      => 'Str',
    comment  => 'name of the database to deploy',
    required => 1,
);

opt dry_run => (
    isa     => 'Bool',
    comment => 'do nothing',
);

arg target2 => (
    isa     => 'Str',
    comment => 'name of the database to deploy',
);

is exception { optargs },
  'usage: 31-usage.t [options] TARGET [options] [TARGET2]

    --quiet           be quiet about it

    TARGET            name of the database to deploy

    --dry-run         do nothing

    TARGET2           name of the database to deploy

', 'usage';

package zz;
use Test::More;
use Test::Fatal;
use OptArgs;

arg target => (
    isa      => 'Str',
    comment  => 'name of the database to deploy',
    required => 1,
);

opt dry_run => (
    isa     => 'Bool',
    comment => 'do nothing',
);

is exception { optargs }, 'usage: 31-usage.t TARGET [options]

    TARGET            name of the database to deploy

    --dry-run         do nothing

', 'usage';

done_testing();
