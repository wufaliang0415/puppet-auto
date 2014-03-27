require 'spec_helper'
 
describe 'ruby::carrot_top', :type => :class do

  it { should create_class('ruby::carrot_top') }
  it { should contain_package('rubygem-carrot-top') }

end
