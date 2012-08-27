require 'spec_helper'

describe 'mysql::service' do
  it { should contain_service('homebrew.mxcl.mysql').with(
    :ensure  => 'running',
    :enable  => 'true',
    :require => ['Class[Mysql::Config]', 'File[/Library/LaunchDaemons/homebrew.mxcl.mysql.plist]']
  )}

  it { should contain_file('/Library/LaunchDaemons/homebrew.mxcl.mysql.plist').with(
    :ensure => 'present',
    :source => 'puppet:///modules/mysql/homebrew.mxcl.mysql.plist'
  )}
end
