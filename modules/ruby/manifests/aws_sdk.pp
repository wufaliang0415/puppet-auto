# Class: ruby::aws_sdk
#
# This module installs the aws_sdk rubygem
#
# Sample Usage:
#   include ruby::aws_sdk
#
class ruby::aws_sdk {

  require ruby

  package {
    'rubygem-aws-sdk':
      ensure    => installed;
  }
}
