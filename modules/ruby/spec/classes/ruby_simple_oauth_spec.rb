require 'spec_helper'
 
describe 'ruby::simple_oauth', :type => :class do

  it { should create_class('ruby::simple_oauth') }
  it { should contain_package('rubygem-simple_oauth') }

end
