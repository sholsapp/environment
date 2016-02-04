class apache {

  case $operatingsystem {
    debian: {
      $packages = [
        'apache2',
        'apache2-utils',
      ]
    }

    ubuntu: {
      $packages = [
        'apache2',
        'apache2-bin',
        'apache2-data',
        'apache2-utils',
      ]
    }

    default: { fail("Unrecognized operating system!") }
  }

  package { $packages:
    ensure => installed,
    before => File['/etc/apache2/apache2.conf'],
  }

  file { '/etc/apache2/apache2.conf':
    ensure  => file,
    owner   => 'root',
    source  => 'puppet:///modules/apache/apache2.conf',
  } ->

  file { '/etc/apache2/mods-enabled/userdir.conf':
    ensure => link,
    target => '/etc/apache2/mods-available/userdir.conf',
    owner  => 'root',
  } ->

  file { '/etc/apache2/mods-enabled/userdir.load':
    ensure => link,
    target => '/etc/apache2/mods-available/userdir.load',
    owner  => 'root',
  }

  service { 'apache2':
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/apache2/apache2.conf'],
  }

}

