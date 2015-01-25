# vagrant/puppet/modules/php/manifests/init.pp
class php {

# Install the php5-fpm and php5-cli packages
  package { 'python-software-properties':
    ensure => present,
    require => Exec['apt-get update'],
  }

#  exec {'add-apt-repository ppa:ondrej/php5-oldstable':
#    path => '/usr/bin/',
#    creates => "/etc/apt/sources.list.d/ondrej-php5-oldstable-precise.list",
#    user => root
#  }
#
#  exec {'lets refresh this dude':
#    command => 'apt-get update',
#    path => '/usr/bin/',
#    user => root
#  }

# Install the php5-fpm and php5-cli packages
  package { ['php5-fpm',
    'php5-cli',
    'php5-intl',
    'php-apc',
    'php5-pgsql',
    'php5-curl']:
    ensure => present,
    install_options => ['--force-yes'],
    require => Exec['apt-get update'],
  }

  file { '/etc/php5/fpm/php.ini':
    source  => 'puppet:///modules/php/php.ini',
    require => Package['php5-fpm'],
  }

  file { '/etc/php5/fpm/pool.d/www.conf':
    source  => 'puppet:///modules/php/www.conf',
    require => Package['php5-fpm'],
  }

  file { '/etc/php5/cli':
    ensure => directory
  }

  file { '/etc/php5/cli/php.ini':
    source  => 'puppet:///modules/php/php.cli.ini',
    require => Package['php5-fpm'],
  }

# Make sure php5-fpm is running
  service { 'php5-fpm':
    ensure => running,
    require => Package['php5-fpm'],
  }

}
