require 'spec_helper'
 
describe 'ruby::webmock', :type => :class do

  it { should create_class('ruby::webmock') }
  it { should contain_package('rubygem-webmock') }

end
