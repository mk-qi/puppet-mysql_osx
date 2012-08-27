require 'spec_helper'

describe 'mysql' do
  it { should include_class('mysql::install') }
  it { should include_class('mysql::config') }
end
