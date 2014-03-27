# Class: ruby::sinatra
#
# This module installs the sinatra rubygem
#
# Sample Usage:
#   include ruby::sinatra
#
# TODO - sinatra-respond_to rpm?
class ruby::sinatra {

  require ruby

  package {
    'rubygem-sinatra':
      ensure    => installed;

#    'sinatra-respond_to':
#      ensure    => installed,
#      provider  => gem;
  }
}
