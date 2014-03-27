# Class: ruby
#
# This module manages the installation of ruby
#
# Sample Usage:
#   include ruby
#
class ruby {

  package {
    'ruby':
      ensure  => 'installed';

    'rubygems':
      ensure  => 'installed',
      require => Package['ruby'];
  }
}
