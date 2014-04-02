require 'spec_helper'
 
describe 'ruby::multi_json', :type => :class do

  it { should create_class('ruby::multi_json') }
  it { should contain_package('rubygem-multi_json') }

end
