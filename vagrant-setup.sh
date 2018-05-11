#!/bin/bash

ROOTPATH=/vagrant
SETUPPATH=$ROOTPATH/vagrant-setup
PACKAGEINSTALLER=$SETUPPATH/packages.sh

# Start by updating the box
echo "=Ubuntu="
$SETUPPATH/machine.sh

# Run when provisioning a new vagrant box to setup and install the required software
# Change into a directory if necessary then call $PACKAGEINSTALLER with the name of the package to install
# Run any additional customisation steps as necessary
$PACKAGEINSTALLER forever
