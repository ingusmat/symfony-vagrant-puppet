class pgsql {

  # Install the php5-fpm and php5-cli packages
  package { 'postgresql':
    ensure  => present,
    require => Exec['apt-get update'],
  }

  $password = 'password'

  user { 'postgres':
    name => 'postgres',
    ensure => present,
  }

  exec {'set postgres user password':
    command => "/bin/echo \"postgres:password\" | /usr/sbin/chpasswd",
    require => User ['postgres']
  }

  file {'pgsql/':
    path => '/var/pgsql',
    ensure => directory,
  }

  file {'data/':
    path => '/var/pgsql/data',
    ensure => directory,
    owner => 'postgres'
  }

  file {'pgsql_data_log':
    path => '/var/pgsql/data/log',
    ensure => directory,
    owner => 'postgres'
  }

  file {'pg_hba_conf':
    source => 'puppet:///modules/pgsql/pg_hba.conf',
    ensure => link,
    path => '/var/pgsql/data/pg_hba.conf'
  }

  file {'postgresql_conf':
    source => 'puppet:///modules/pgsql/postgresql.conf',
    ensure => link,
    path => '/var/pgsql/data/postgresql.conf'
  }

#
# Run Postgresql
  service { 'postgresql':
    ensure => running,
    require => Package['postgresql'],
  }

  user { 'symfony':
    ensure => present,
    managehome => true
  }

  exec {'set symfony user password':
    command => "/bin/echo \"symfony:hHcpm9wNzGkw\" | /usr/sbin/chpasswd",
    require => User ['symfony']
  }

}
