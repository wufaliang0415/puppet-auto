require 'spec_helper'
 
describe 'ruby::rake', :type => :class do

  it { should create_class('ruby::rake') }
  it { should contain_package('rubygem-rake') }

end
