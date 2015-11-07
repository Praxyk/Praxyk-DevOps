#!/bin/bash

# @author John Allard, Nick Corgan, others
# @github https://github.com/Praxyk/praxyk-devops

# this script installs and builds all system wide (ubuntu) and python level
# requirements needed by the devops server

export DEBIAN_FRONTEND=noninteractive

xargs sudo apt-get -y install < .ubuntu_install

RETVAL=$?
[ $RETVAL -eq 0 ] && echo "  Devops-Server : Ubuntu Requirements Install Success"
[ $RETVAL -ne 0 ] && echo "  Devops-Server : Ubuntu Requirements Install Failure" && exit 1

sudo pip install -r .pip_install 
RETVAL=$?
[ $RETVAL -eq 0 ] && echo "  Devops-Server : Pip Requirements Install Success"
[ $RETVAL -ne 0 ] && echo "  Devops-Server : Pip Requirements Install Failure" && exit 1

sudo apt-get -q -y install mysql-server
sudo service mysql restart
mysql -e "create database IF NOT EXISTS test;" -uroot

RETVAL=$?
[ $RETVAL -eq 0 ] && echo "  DevOps-Server : MySQL Requirements Install Success"
[ $RETVAL -ne 0 ] && echo "  DevOps-Server : MySQL Requirements Install Failure" && exit 1

exit 0

