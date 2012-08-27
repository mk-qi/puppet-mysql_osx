require 'spec_helper'

describe 'mysql_osx::config' do
  it { should contain_file('/etc/my.cnf').with(
    :ensure  => 'present',
    :source  => 'puppet:///modules/mysql_osx/my-large.cnf',
    :owner   => '_mysql',
    :group   => '_mysql',
    :require => 'Class[Mysql_osx::Install]',
    :notify  => 'Class[Mysql_osx::Service]'
  )}
end
