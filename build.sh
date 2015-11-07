#!/bin/bash

# @author John Allard, Nick Corgan, others
# @github https://github.com/Praxyk/praxyk-devops

# this script installs and builds all system wide (ubuntu) and python level
# requirements needed by the devops server

xargs sudo apt-get -y install < .ubuntu_install

RETVAL=$?
[ $RETVAL -eq 0 ] && echo "  Devops: Ubuntu Requirements Install Success"
[ $RETVAL -ne 0 ] && echo "  Devops : Ubuntu Requirements Install Failure" && exit 1

sudo pip install -r .pip_install 
RETVAL=$?
[ $RETVAL -eq 0 ] && echo "  Devops : Pip Requirements Install Success"
[ $RETVAL -ne 0 ] && echo "  Devops : Pip Requirements Install Failure" && exit 1

exit 0

