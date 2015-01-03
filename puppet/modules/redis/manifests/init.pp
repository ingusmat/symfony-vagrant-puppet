class redis {
  package {'redis-server':
    ensure => present,
    name => 'redis-server',
    require => Exec['apt-get update'],
  }

  file {'redis.conf':
    path => '/etc/redis/redis.conf',
    ensure => link,
    source => 'puppet:///modules/redis/redis.conf'
  }

  service {'redis-server':
    name => 'redis-server',
    ensure => running
  }
}
