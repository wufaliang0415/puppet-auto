require 'spec_helper'
 
describe 'ruby::mp3info', :type => :class do

  it { should create_class('ruby::mp3info') }
  it { should contain_package('rubygem-mp3info') }

end
