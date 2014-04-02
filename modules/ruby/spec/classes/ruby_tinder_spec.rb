require 'spec_helper'
 
describe 'ruby::tinder', :type => :class do

  it { should create_class('ruby::tinder') }
  it { should contain_package('rubygem-tinder') }

end
