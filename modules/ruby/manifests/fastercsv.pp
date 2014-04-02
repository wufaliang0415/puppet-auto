# Class: ruby::fastercsv
#
# This module installs the fastercsv rubygem
#
# Sample Usage:
#   include ruby::fastercsv
#
class ruby::fastercsv {

  require ruby

  package {
    'rubygem-fastercsv':
      ensure    => installed;
  }
}
