# Class: ruby::rack
#
# This module installs the rack rubygem
#
# Sample Usage:
#   include ruby::rack
#
class ruby::rack {

  require ruby

  package {
    'rubygem-rack':
      ensure    => installed;
  }
}
