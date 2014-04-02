# Class: ruby::tinder
#
# This module installs the tinder rubygem
#
# Sample Usage:
#   include ruby::tinder
#
class ruby::tinder {

  require ruby

  package {
    'rubygem-tinder':
      ensure    => installed;
  }
}
