# Class: ruby::riak_client
#
# This module installs the riak-client rubygem
#
# Sample Usage:
#   include ruby::riak_client
#
class ruby::riak_client {

  require ruby

  package {
    'rubygem-riak-client':
      ensure    => installed;
  }
}
