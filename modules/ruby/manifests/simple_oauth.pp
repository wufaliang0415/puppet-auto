# Class: ruby::simple_oauth
#
# This module installs the simple_oauth rubygem
#
# Sample Usage:
#   include ruby::simple_oauth
#
class ruby::simple_oauth {

  require ruby

  package {
    'rubygem-simple_oauth':
      ensure    => installed;
  }
}
