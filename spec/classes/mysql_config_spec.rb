require 'spec_helper'

describe 'mysql::config' do
  it { should contain_file('/etc/my.cnf').with(
    :ensure  => 'present',
    :source  => 'puppet:///modules/mysql/my-large.cnf',
    :owner   => '_mysql',
    :group   => '_mysql',
    :require => 'Class[Mysql::Install]',
    :notify  => 'Class[Mysql::Service]'
  )}
end
