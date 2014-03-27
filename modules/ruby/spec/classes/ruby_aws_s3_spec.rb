require 'spec_helper'
 
describe 'ruby::aws_s3', :type => :class do

  it { should create_class('ruby::aws_s3') }
  it { should contain_package('rubygem-aws-s3') }

end
