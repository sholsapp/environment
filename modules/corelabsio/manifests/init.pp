class corelabsio {

  # We assume that your user is named this.
  $login = 'ubuntu'

  @user { $login:
    comment => 'Development User',
  }

  include 'docker'
  include corelabsio::workspace
  include corelabsio::snake

  $packages = [
    'autoconf',
    'cmake',
    'g++',
    'gcc',
    'gdb',
    'lcov',
    'libtool',
    'mosh',
    'screen',
    'sudo',
    'tree',
    'valgrind',
    'vim',
  ]

  package { $packages:
    ensure => installed,
  }

  $directories = [
    "/home/$login/bin",
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

  User<| title == $login |> { groups +> ['sudo', 'docker']}

}
