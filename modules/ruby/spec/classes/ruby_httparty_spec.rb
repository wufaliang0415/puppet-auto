require 'spec_helper'
 
describe 'ruby::httparty', :type => :class do

  it { should create_class('ruby::httparty') }
  it { should contain_package('rubygem-httparty') }

end
