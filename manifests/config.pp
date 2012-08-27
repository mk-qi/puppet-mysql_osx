class mysql_osx::config {
  file { '/etc/my.cnf':
    ensure  => 'present',
    source  => 'puppet:///modules/mysql_osx/my-large.cnf',
    owner   => '_mysql',
    group   => '_mysql',
    require => Class['mysql_osx::install'],
    notify  => Class['mysql_osx::service']
  }
}
