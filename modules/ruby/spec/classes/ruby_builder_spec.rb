require 'spec_helper'
 
describe 'ruby::builder', :type => :class do

  it { should create_class('ruby::builder') }
  it { should contain_package('rubygem-builder') }

end
