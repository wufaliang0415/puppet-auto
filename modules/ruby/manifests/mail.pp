# Class: ruby::mail
#
# This module installs the mail rubygem
#
# Sample Usage:
#   include ruby::mail
#
class ruby::mail {

  require ruby

  package {
    'rubygem-mail':
      ensure    => installed;
  }
}
