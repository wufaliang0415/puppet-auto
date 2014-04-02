require 'spec_helper'
 
describe 'ruby::http_parser_rb', :type => :class do

  it { should create_class('ruby::http_parser_rb') }
  it { should contain_package('rubygem-http_parser.rb') }

end
