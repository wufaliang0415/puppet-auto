require 'spec_helper'
 
describe 'ruby::hipchat', :type => :class do

  it { should create_class('ruby::hipchat') }
  it { should contain_package('rubygem-hipchat') }

end
