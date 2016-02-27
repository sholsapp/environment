class corelabsio::workspace {

  $packages = [
    'git',
  ]

  package { $packages:
    ensure => installed,
  }

  $directories = [
    "/home/$corelabsio::login/workspace",
  ]

  file { $directories:
    ensure => directory,
    owner => $corelabsio::login,
    group => $corelabsio::login,
  }

  define corelabs_github ($owner, $repo = $title) {
    vcsrepo { "/home/$corelabsio::login/workspace/$repo":
      ensure   => present,
      provider => 'git',
      source   => "https://github.com/$owner/$repo.git",
      owner    => $corelabsio::login,
      group    => $corelabsio::login,
      submodules => true,
    }
  }

  corelabs_github { 'gallocy':
    owner => 'sholsapp',
  } 

  corelabs_github { 'cthulhu':
    owner => 'corelabsio',
  }

}
