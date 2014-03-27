require 'spec_helper'
 
describe 'ruby::riak_client', :type => :class do

  it { should create_class('ruby::riak_client') }
  it { should contain_package('rubygem-riak-client') }

end
