# vagrant-setup-shell

A small collection of scripts which can be used to set up and configure a vagrant VM.

The design is oriented around 3 files: `vagrant-env.sh` (for setting up environment variables), `vagrant-setup.sh` (for doing general machine provisioning), and `vagrant-start.sh` for doing informal service staring. Yes, using puppet standalone also achieves this much better, but this is easier to set up initially.

The machine will boot, configure environment variables, install the required packages and then start any services set.

## Packages

Packages are specified in `vagrant-setup/packages`. They are instructions to set up that piece of software and do any necessary general configuration. An example for `forever`, a Node.JS tool to run scripts is included.

Each package should include a `global.sh` file to perform any global installation (such as running `apt-get`, `npm install` or similar). This will perform any system-wide installation steps, and so instructions should not rely on the current working directory being anywhere in particular. Commands such as `where` could be used to determine if installation has already happened and save some work.

Packages may also optionally have a `local.sh` file to perform actions in the current working directory. This should be run each time the package is installed as it would perform actions such as reading a python `requirements.txt` or node `package.json` and installing any local requirements.

A `require` file can be used if a package requires another package to be installed before it. In the case of `forever`, it requires `nodejs` to be installed first. The file should contain package names of the requirements which are linux new line separated.

## Running

For Windows, a script called `setup.cmd` will also check the windows machine to ensure that both Vagrant and VirtualBox are installed before bringing the machine up.

Other platforms are less straightforward in their local setup so no wrapper scripts are provided. The main advantage to a wrapper script over just running `vagrant up` is that it also allows for commands to be executed after the machine has powered up and been provisioned, such as opening a web page.

## Using

Copy and paste the files into the repo you are going to work in, there isn't a nice way of making this either a git submodule or installable with some sort of dependency manager.
