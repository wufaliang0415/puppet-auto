require 'spec_helper'
 
describe 'ruby::rack', :type => :class do

  it { should create_class('ruby::rack') }
  it { should contain_package('rubygem-rack') }

end
