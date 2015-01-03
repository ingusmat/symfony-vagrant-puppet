class curl {

  package { ['curl', 'libcurl3']:
    ensure  => present,
    require => Exec['apt-get update'],
  }

}

