# Class: ruby::mock_aws_s3
#
# This module installs the mock-aws-s3 rubygem
#
# Sample Usage:
#   include ruby::mock_aws_s3
#
class ruby::mock_aws_s3 {

  require ruby

  package {
    'rubygem-mock-aws-s3':
      ensure    => installed;
  }
}
