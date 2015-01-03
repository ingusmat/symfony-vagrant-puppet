class symfony_installer {

  file {'installer':
    path => '/usr/local/bin/symfony',
    source => 'puppet:///modules/symfony_installer/symfony.phar',
    mode => 'a+x'
  }
}