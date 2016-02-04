#!/bin/sh
puppet module install puppetlabs-vcsrepo --modulepath ./modules
puppet module install stankevich-python --modulepath ./modules
puppet apply --modulepath ./modules manifests/site.pp
