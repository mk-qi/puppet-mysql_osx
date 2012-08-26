# Puppet-MySQL

A Puppet Module to manage MySQL on Mac OS X.

## Installation

This module depends on bjoernalbers-homebrew.
The easiest way to install it and resolv the dependency is via the Puppet Module Tool:

```bash
puppet module install bjoernalbers-mysql
```

## Usage

Install the MySQL Server on a node:

```puppet
class { 'mysql': }
```

## Contribution

1. Fork the [official repository](https://github.com/bjoernalbers/puppet-mysql).
2. Bootstrap your development environment: `cd mysql && script/bootstrap`.
3. Have some fun hacking... and don't forget to send me your pull request.

## License

Copyright (c) 2012 Björn Albers (MIT License)
