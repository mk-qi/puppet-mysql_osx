class mysql::install {
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
}
