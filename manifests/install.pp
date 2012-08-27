class mysql_osx::install {
  package { 'mysql':
    ensure   => present,
    provider => brew,
    require  => User['_mysql']
  }

  user { '_mysql':
    ensure  => present,
    comment => 'MySQL User',
    home    => '/var/empty',
    shell   => '/usr/bin/false',
    gid     => '_mysql'
  }

  group { '_mysql':
    ensure => present,
  }

  exec { 'mysql_install_db':
    command   => '/usr/local/bin/mysql_install_db --verbose --user=_mysql --basedir="$(/usr/local/bin/brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp',
    creates   => '/usr/local/var/mysql',
    logoutput => 'on_failure',
    require   => Package['mysql']
  }

  # manage root password if it is set
  if $mysql_osx::root_password != 'UNSET' {
    case $mysql_osx::old_root_password {
      '':      { $old_pw='' }
      default: { $old_pw="-p'${mysql_osx::old_root_password}'" }
    }

    exec { 'set_mysql_rootpw':
      command   => "/usr/local/bin/mysqladmin -u root ${old_pw} password '${mysql_osx::root_password}'",
      logoutput => true,
      unless    => "/usr/local/bin/mysqladmin -u root -p'${mysql_osx::root_password}' status > /dev/null",
      notify    => Class['mysql_osx::service'],
      require   => Exec['mysql_install_db']
    }
  }
}
