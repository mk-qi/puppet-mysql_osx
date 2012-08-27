require 'spec_helper'

describe 'mysql_osx::service' do
  it { should contain_service('homebrew.mxcl.mysql').with(
    :ensure  => 'running',
    :enable  => 'true',
    :require => ['Class[Mysql_osx::Config]', 'File[/Library/LaunchDaemons/homebrew.mxcl.mysql.plist]']

  )}

  it { should contain_file('/Library/LaunchDaemons/homebrew.mxcl.mysql.plist').with(
    :ensure => 'present',
    :source => 'puppet:///modules/mysql_osx/homebrew.mxcl.mysql.plist',
    :owner  => 'root',
    :group  => 'wheel',
    :mode   => '0644'
  )}
end
