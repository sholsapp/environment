# environment

These instructions are useful for getting your development environment up and
running.

## system image

We suggest using [debian](https://www.debian.org/distrib) for development, but
any Linux operating system with a kernel greater than or at version 3.16.0
should work.

We suggest using [virtualbox](https://www.virtualbox.org/wiki/Downloads) for
development. This allows us to build fresh images from source periodically to
prevent bit rot.

During installation of your operating system, we suggest installing as few
packages as possible to keep the image small. **Create a user named "ubuntu".**

In your virtual machine's settings page, setup your virtual machine's network
adapter to be in "bridge" mode so the virtual machine is available from the
host. This way you can use `ssh` to connect to your virtual machine.

> Note, if you configure your virtual machine in "bridge" mode others will see
> the machine on the network. Only do this on trusted networks.

Once you're done, you should have a bootable Debian instance. In the virtual
machine's console, discover the virtual machine's internet address.

```
/sbin/ifconfig | less
```

From your host machine, connect to the virtual machine using ssh
(alternatively, use [mosh](https://mosh.mit.edu/)), replacing `10.0.0.1` with
the virtual machine's address that you learned from the prior step.

```
mosh ubuntu@10.0.0.1
```

You're done bootstrapping the system image!

## development environment

For better or worse, we use [puppet](https://puppetlabs.com/) to manage our
development environment, and have our modules checked in to a git repository.
You'll need to install puppet and git.

```
su
apt-get install puppet
apt-get install git
```

After you have puppet and git, check out our puppet modules on the node you
would like to bootstrap.

```
git clone https://github.com/corelabsio/environment
```

We always suggest learning what the puppet modules are doing by reading the
source. After all, you're running these modules as the root user, so you should
know what they're doing. Get a beer, find yourself an hour of time, and learn
what these modules are doing by reading their source code.

```
su
cd environment
./install.sh
```

A few of the external modules that we use spit out warnings, but there should
be no errors output to the terminal.

You're done!
