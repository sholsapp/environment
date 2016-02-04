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

  define corelabs_github (String $owner, String $repo) {
    vcsrepo { "/home/$corelabsio::login/workspace/$repo":
      ensure   => present,
      provider => 'git',
      source   => "https://github.com/$owner/$repo.git",
      owner    => $corelabsio::login,
      group    => $corelabsio::login,
    }
  }

  corelabs_github {[
    ['sholsapp', 'gallocy'],
    ['corelabsio', 'cthulhu'],
  ]:}

}
