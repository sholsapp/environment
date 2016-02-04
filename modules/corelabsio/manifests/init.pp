class corelabsio {

  $login = 'ubuntu'

  include 'docker'
  include corelabsio::workspace
  include corelabsio::python

  $packages = [
    'autoconf',
    'cmake',
    'g++',
    'gcc',
    'gdb',
    'libtool',
    'screen',
    'tree',
    'valgrind',
    'vim',
  ]

  package { $packages:
    ensure => installed,
  }

  $directories = [
    "/home/$login/bin",
    "/home/$login/workspace",
    "/home/$login/public_html",
    "/home/$login/.ssh",
    "/home/$login/.virtualenvs",
  ]

  file { $directories:
    ensure => directory,
    owner => $login,
    group => $login,
  }

  file { '/etc/motd':
    ensure => file,
    source => 'puppet:///modules/corelabsio/motd';
  }

}
