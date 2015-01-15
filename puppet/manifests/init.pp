exec { 'apt-get update':
  path => '/usr/bin',
}

package { 'vim':
  ensure => present,
}

file { '/var/www/':
  ensure => 'directory',
}

include  curl, php, nginx, libxml, pgsql, memcached, nodejs, symfony_installer, redis, composer