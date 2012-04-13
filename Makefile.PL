
use strict;
use warnings;

use 5.008;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Cmdline tool around Data::DPath",
  "AUTHOR" => "Steffen Schwigon <ss5\@renormalist.net>",
  "BUILD_REQUIRES" => {
    "Data::Structure::Util" => 0,
    "Test::Deep" => 0,
    "Test::More" => "0.88",
    "YAML::Syck" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "App-DPath",
  "EXE_FILES" => [
    "bin/dpath"
  ],
  "LICENSE" => "perl",
  "NAME" => "App::DPath",
  "PREREQ_PM" => {
    "App::Cmd::Setup" => 0,
    "Config::General" => 0,
    "Config::INI::Serializer" => 0,
    "Data::DPath" => 0,
    "Data::Dumper" => 0,
    "JSON" => 0,
    "Scalar::Util" => 0,
    "TAP::DOM" => 0,
    "XML::Simple" => 0,
    "YAML::Any" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.04",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



