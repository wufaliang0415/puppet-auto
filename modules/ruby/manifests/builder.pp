# Class: ruby::builder
#
# This module installs the builder rubygem
#
# Sample Usage:
#   include ruby::builder
#
class ruby::builder {

  require ruby

  package {
    'rubygem-builder':
      ensure    => installed;
  }
}
