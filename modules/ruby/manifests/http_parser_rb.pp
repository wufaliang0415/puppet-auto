# Class: ruby::http_parser.rb
#
# This module installs the http_parser.rb rubygem
#
# Sample Usage:
#   include ruby::http_parser.rb
#
class ruby::http_parser_rb {

  require ruby

  package {
    'rubygem-http_parser.rb':
      ensure    => installed;
  }
}
