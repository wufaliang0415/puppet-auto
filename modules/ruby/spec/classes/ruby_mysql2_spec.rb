require 'spec_helper'
 
describe 'ruby::mysql2', :type => :class do

  it { should create_class('ruby::mysql2') }
  it { should contain_package('rubygem-mysql2') }

end
