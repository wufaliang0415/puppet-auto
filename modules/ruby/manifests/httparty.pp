# Class: ruby::httparty
#
# This module installs the httparty rubygem
#
# Sample Usage:
#   include ruby::httparty
#
class ruby::httparty {

  require ruby

  package {
    'rubygem-httparty':
      ensure    => installed;
  }
}
