exec { 'apt-get update':
  path => '/usr/bin',
}

package { 'vim':
  ensure => present,
}

file { '/var/www/':
  ensure => 'directory',
}

include  curl, php, nginx, libxml, pgsql, memcached, nodejs, redis, composer, symfony_installer