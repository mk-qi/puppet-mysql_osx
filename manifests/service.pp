class mysql_osx::service {
  service { 'homebrew.mxcl.mysql':
    ensure  => running,
    enable  => true,
    require => [ Class['mysql_osx::config'], File['/Library/LaunchDaemons/homebrew.mxcl.mysql.plist'] ]
  }

  file { '/Library/LaunchDaemons/homebrew.mxcl.mysql.plist':
    ensure => present,
    source => 'puppet:///modules/mysql_osx/homebrew.mxcl.mysql.plist',
    owner  => 'root',
    group  => 'wheel',
    mode   => 0644
  }
}
