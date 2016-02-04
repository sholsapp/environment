class personal::my_python {

  class { 'python':
    version    => 'system',
    dev        => true,
    virtualenv => true,
  }

  $venv = '/home/ubuntu/.virtualenvs/primary'

  python::virtualenv { $venv:
    ensure     => present,
    version    => 'system',
    systempkgs => true,
    owner      => 'ubuntu',
    group      => 'ubuntu',
  }

  $pip_packages = [
    'pip',
    'wheel',
    'pex',
  ]

  python::pip { $pip_packages:
    ensure     => 'latest',
    virtualenv => $venv,
    owner      => 'ubuntu',
  }

}
