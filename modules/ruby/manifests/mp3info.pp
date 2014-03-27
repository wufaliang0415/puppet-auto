# Class: ruby::mp3info
#
# This module installs the mp3info rubygem
#
# Sample Usage:
#   include ruby::mp3info
#
class ruby::mp3info {

  require ruby

  package {
    'rubygem-mp3info':
      ensure    => installed;
  }
}
