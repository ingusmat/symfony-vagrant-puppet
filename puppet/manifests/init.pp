exec { 'apt-get update':
  path => '/usr/bin',
}

package { 'vim':
  ensure => present,
}

file { '/var/www/':
  ensure => 'directory',
}

include  php, nginx, libxml, pgsql, curl, memcached, nodejs, symfony_installer, redis, composer