require 'spec_helper'

describe 'mysql' do
  describe 'on Mac OS X' do
    it { should contain_package('mysql').with(
      :ensure   => 'present',
      :provider => 'brew',
      :require  => 'User[_mysql]'
    )}

    it { should contain_group('_mysql').with(
      :ensure => 'present'
    )}

    it { should contain_user('_mysql').with(
      :ensure  => 'present',
      :comment => 'MySQL User',
      :home    => '/var/empty',
      :shell   => '/usr/bin/false',
      :gid     => '_mysql'
    )}

    it { should contain_exec('mysql_install_db').with(
      :command   => '/usr/local/bin/mysql_install_db --verbose --user=_mysql --basedir="$(/usr/local/bin/brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp',
      :creates   => '/usr/local/var/mysql',
      :logoutput => 'on_failure',
      :require   => 'Package[mysql]'
    )}
  end
end
