#!/bin/bash

# @author John Allard, Nick Corgan, others
# @github https://github.com/Praxyk/praxyk-devops

# this script installs and builds all system wide (ubuntu) and python level
# requirements needed by the devops server
echo "Beginning Praxyk-Devops Build Process"
echo "______________________________"

cp -R .praxykdevops/ ~/.praxykdevops # move the fake config files to the home directory

declare -a arr=("server" "client" )

sudo apt-get install -y git python-dev python-pip build-essential
git submodule update --init --recursive

for i in "${arr[@]}"
do
    echo "  Starting $i Build Process"
    cd "$i"
    ./build.sh
    RETVAL=$?
    [ $RETVAL -eq 0 ] && echo "  Module $i Build Success"
    [ $RETVAL -ne 0 ] && echo "  Module $i Build Failure" && exit 1
    cd ..
done


echo "Praxyk-Devops Build Success"
echo "______________________________"
exit 0

