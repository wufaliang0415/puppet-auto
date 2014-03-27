# Class: ruby::redis
#
# This module installs the redis rubygem
#
# Sample Usage:
#   include ruby::redis
#
class ruby::redis {

  require ruby

  package {
    'rubygem-redis':
      ensure    => installed;
  }
}
