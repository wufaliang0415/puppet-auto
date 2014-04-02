require 'spec_helper'
 
describe 'ruby::rspec', :type => :class do

  it { should create_class('ruby::rspec') }
  it { should contain_package('rubygem-rspec') }

end
