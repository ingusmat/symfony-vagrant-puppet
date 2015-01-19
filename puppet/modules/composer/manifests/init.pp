class composer {

  exec { 'create swap directories':
    command => '/bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024 && /sbin/mkswap /var/swap.1 && /sbin/swapon /var/swap.1',
    path => '/',
    user => root,
    creates => '/var/swap.1'
  }

  exec { 'composer_install':
    command => 'curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer',
    path    => '/usr/bin',
    require => Package['curl', 'php5-fpm'],
    unless => 'which composer'
  }
}