#!/bin/sh
puppet --version || exit 1
puppet module install garethr-docker --modulepath ./modules || exit 1
puppet module install puppetlabs-vcsrepo --modulepath ./modules || exit 1
puppet module install stankevich-python --modulepath ./modules || exit 1
puppet apply --modulepath ./modules manifests/site.pp || exit 1
