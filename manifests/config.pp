class mysql::config {
  file { '/etc/my.cnf':
    ensure  => 'present',
    source  => 'puppet:///modules/mysql/my-large.cnf',
    owner   => '_mysql',
    group   => '_mysql',
    require => Class['mysql::install']
  }
}
