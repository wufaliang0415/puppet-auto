require 'spec_helper'
 
describe 'ruby::bundler', :type => :class do

  it { should create_class('ruby::bundler') }
  it { should contain_package('rubygem-bundler') }

end
