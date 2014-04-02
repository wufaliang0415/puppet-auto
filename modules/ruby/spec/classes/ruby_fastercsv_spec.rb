require 'spec_helper'
 
describe 'ruby::fastercsv', :type => :class do

  it { should create_class('ruby::fastercsv') }
  it { should contain_package('rubygem-fastercsv') }

end
