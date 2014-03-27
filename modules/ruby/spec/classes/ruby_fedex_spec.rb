require 'spec_helper'
 
describe 'ruby::fedex', :type => :class do

  it { should create_class('ruby::fedex') }
  it { should contain_package('rubygem-fedex') }

end
