class mysql::service {
  service { 'homebrew.mxcl.mysql':
    ensure  => running,
    enable  => true,
    require => [ Class['mysql::config'], File['/Library/LaunchDaemons/homebrew.mxcl.mysql.plist'] ]
  }

  file { '/Library/LaunchDaemons/homebrew.mxcl.mysql.plist':
    ensure => present,
    source => 'puppet:///modules/mysql/homebrew.mxcl.mysql.plist'
  }
}
