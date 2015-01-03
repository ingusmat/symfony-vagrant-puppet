class memcached {

  package { ['memcached', 'libmemcached-dev']:
    ensure  => present,
    require => Exec['apt-get update'],
  }

  file {'memcached_conf':
    source => 'puppet:///modules/memcached/memcached.conf',
    ensure => link,
    path => '/etc/memcached.conf'
  }

  service { 'memcached':
    ensure => running,
    require => Package['memcached']
  }

}