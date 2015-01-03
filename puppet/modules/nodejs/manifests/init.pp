class nodejs {

  package { ['nodejs', 'npm']:
    ensure  => present,
    require => Exec['apt-get update'],
  }

}