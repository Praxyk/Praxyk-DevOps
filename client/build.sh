#!/bin/bash

cp devops_client.py ~/.devops_client
sudo ln -s ~/.devops_client /usr/bin/devops_client
mkdir -p ~/.praxykdevops/client/

echo "praxyk_client script ready to be used."

exit 0
