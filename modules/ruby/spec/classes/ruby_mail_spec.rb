require 'spec_helper'
 
describe 'ruby::mail', :type => :class do

  it { should create_class('ruby::mail') }
  it { should contain_package('rubygem-mail') }

end
