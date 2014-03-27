require 'spec_helper'
 
describe 'ruby::mock_aws_s3', :type => :class do

  it { should create_class('ruby::mock_aws_s3') }
  it { should contain_package('rubygem-mock-aws-s3') }

end
