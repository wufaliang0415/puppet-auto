# Class: ruby::fedex
#
# This module installs the fedex rubygem
#
# Sample Usage:
#   include ruby::fedex
#
class ruby::fedex {

  require ruby

  package {
    'rubygem-fedex':
      ensure    => installed;
  }
}
