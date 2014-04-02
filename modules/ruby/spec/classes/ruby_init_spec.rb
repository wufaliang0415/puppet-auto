require 'spec_helper'
 
describe 'ruby', :type => :class do

  it { should create_class('ruby') }
  it { should contain_package('ruby') }
  it { should contain_package('rubygems') }

end
