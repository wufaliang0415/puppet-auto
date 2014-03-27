# Class: ruby::multi_json
#
# This module installs the multi_json rubygem
#
# Sample Usage:
#   include ruby::multi_json
#
class ruby::multi_json {

  require ruby

  package {
    'rubygem-multi_json':
      ensure    => installed;
  }
}
