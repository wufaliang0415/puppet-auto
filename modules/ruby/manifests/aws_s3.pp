# Class: ruby::aws_s3
#
# This module installs the aws_s3 rubygem
#
# Sample Usage:
#   include ruby::aws_s3
#
class ruby::aws_s3 {

  require ruby

  package {
    'rubygem-aws-s3':
      ensure    => installed;
  }
}
