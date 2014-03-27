# Class: ruby::webmock
#
# This module installs the webmock rubygem
#
# Sample Usage:
#   include ruby::webmock
#
class ruby::webmock {

  require ruby

  package {
    'rubygem-webmock':
      ensure    => installed;
  }
}
