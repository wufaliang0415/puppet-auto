# Class: ruby::bundler
#
# This module installs the bundler rubygem
#
# Sample Usage:
#   include ruby::bundler
#
class ruby::bundler {

  require ruby

  package {
    'rubygem-bundler':
      ensure    => installed;
  }
}
