#!/bin/sh
PUPPET=$(which puppet)
$PUPPET --version || exit 1
$PUPPET module install garethr-docker --modulepath ./modules || exit 1
$PUPPET module install puppetlabs-vcsrepo --modulepath ./modules || exit 1
$PUPPET module install stankevich-python --modulepath ./modules || exit 1
$PUPPET apply --modulepath ./modules manifests/site.pp || exit 1
