# Class: ruby::mysql2
#
# This module installs the mysql2 rubygem
#
# Sample Usage:
#   include ruby::mysql2
#
class ruby::mysql2 {

  require ruby

  package {
    'rubygem-mysql2':
      ensure    => installed;
  }
}
