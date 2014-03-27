# Class: ruby::logging
#
# This module installs the logging rubygem
#
# Sample Usage:
#   include ruby::logging
#
class ruby::logging {

  require ruby

  package {
    'rubygem-logging':
      ensure    => installed;
  }
}
