require 'spec_helper'
 
describe 'ruby::sinatra', :type => :class do

  it { should create_class('ruby::sinatra') }
  it { should contain_package('rubygem-sinatra') }

end
