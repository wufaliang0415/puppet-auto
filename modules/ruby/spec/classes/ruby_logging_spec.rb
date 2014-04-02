require 'spec_helper'

describe 'ruby::logging', :type => :class do

  it { should create_class('ruby::logging') }
  it { should contain_package('rubygem-logging') }

end
