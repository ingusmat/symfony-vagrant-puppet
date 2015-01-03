#apt-get install libxml2-dev libxslt1-dev python-dev

class libxml {

# Install the libxml2-dev libxslt-dev python-dev and lib32z1-dev packages
  package { ['libxml2-dev',
    'libxslt-dev']:
    ensure => present,
    require => Exec['apt-get update'],
  }
}