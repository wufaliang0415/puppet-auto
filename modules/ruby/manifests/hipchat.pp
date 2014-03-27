# Class: ruby::hipchat
#
# This module installs the hipchat rubygem
#
# Sample Usage:
#   include ruby::hipchat
#
class ruby::hipchat {

  require ruby

  package {
    'rubygem-hipchat':
      ensure    => installed;
  }
}
