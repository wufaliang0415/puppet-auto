# Class: ruby::rspec
#
# This module installs the rspec rubygem
#
# Sample Usage:
#   include ruby::rspec
#
class ruby::rspec {

  require ruby

  package {
    'rubygem-rspec':
      ensure    => installed;
  }
}
