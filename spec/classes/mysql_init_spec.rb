require 'spec_helper'

describe 'mysql' do
  it { should include_class('mysql::install') }
  it { should include_class('mysql::config') }
  it { should include_class('mysql::service') }
end
