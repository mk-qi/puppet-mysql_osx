require 'spec_helper'

describe 'mysql_osx' do
  it { should include_class('mysql_osx::install') }
  it { should include_class('mysql_osx::config') }
  it { should include_class('mysql_osx::service') }
end
