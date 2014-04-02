require 'spec_helper'
 
describe 'ruby::guid', :type => :class do

  it { should create_class('ruby::guid') }
  it { should contain_package('rubygem-guid') }

end
