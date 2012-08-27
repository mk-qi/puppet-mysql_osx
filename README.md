# Puppet-MySQL_OSX

Manage MySQL Server on Mac OS X.

## Installation

Just pull it from [Puppet
Forge](http://forge.puppetlabs.com/bjoernalbers/mysql_osx):

```bash
puppet module install bjoernalbers-mysql_osx
```

(This module depends on
[bjoernalbers-homebrew](http://forge.puppetlabs.com/bjoernalbers/homebrew).)

## Usage

Install the MySQL Server on a node:

```puppet
class { 'mysql_osx':
  root_password => 'secret',  # Defaults to a blank password.
}
```

(Note: You also have to provide the `old_root_password` on password changes!)

## Contribution

1. Fork the [official repository](https://github.com/bjoernalbers/puppet-mysql).
2. Bootstrap your development environment: `cd mysql && script/bootstrap`.
3. Have some fun hacking... and don't forget to send me your pull request.

## License

Copyright (c) 2012 Björn Albers (Apache License, Version 2.0)
