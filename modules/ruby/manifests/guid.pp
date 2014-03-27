# Class: ruby::guid
#
# This module installs the guid rubygem
#
# Sample Usage:
#   include ruby::guid
#
class ruby::guid {

  require ruby

  package {
    'rubygem-guid':
      ensure    => installed;
  }
}
