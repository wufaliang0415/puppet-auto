require 'spec_helper'
 
describe 'ruby::redis', :type => :class do

  it { should create_class('ruby::redis') }
  it { should contain_package('rubygem-redis') }

end
