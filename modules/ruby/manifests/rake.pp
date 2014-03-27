# Class: ruby::rake
#
# This module manages the installation of ruby::rake
#
# Sample Usage:
#   include ruby::rake
#
class ruby::rake {

  package {
    'rubygem-rake':
      ensure  => 'installed';
  }
}
