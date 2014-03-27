# Class: ruby::carrot_top
#
# This module installs the carrot-top rubygem
#
# Sample Usage:
#   include ruby::carrot_top
#
class ruby::carrot_top {

  require ruby

  package {
    'rubygem-carrot-top':
      ensure    => installed;
  }
}
