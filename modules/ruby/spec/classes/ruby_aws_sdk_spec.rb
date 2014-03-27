require 'spec_helper'

describe 'ruby::aws_sdk', :type => :class do

  it { should create_class('ruby::aws_sdk') }
  it { should contain_package('rubygem-aws-sdk') }

end
