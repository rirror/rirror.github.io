#!/bin/sh

echo "--- creating rirror node ---"
lxc launch ubuntu:18.10 rirror

echo "--- installing updates ---"
lxc exec rirror -- apt-get -y update
# unattended-upgrades is preinstalled in 18.10
#lxc exec rirror -- apt-get -y install unattended-upgrades
lxc exec rirror -- unattended-upgrades -v

echo "--- installing git, ipython (bash replacement) and jobber ---"
lxc exec rirror -- apt-get -y install git ipython
lxc exec rirror -- curl -LO https://github.com/dshearer/jobber/releases/download/v1.2.1/jobber_1.2.1-1_amd64.deb
lxc exec rirror -- dpkg -i jobber_1.2.1-1_amd64.deb 

echo "--- adding github.com to known_hosts ---"
lxc exec rirror -- bash -c "ssh-keyscan github.com >> ~/.ssh/known_hosts"

echo "--- uploading sync scripts ---"
lxc file push sync-*.sh rirror/root/
lxc exec rirror -- bash -c "chmod +rx *.sh"

echo "--- generating deploy keys ---"
# keys are named after GitHub repositories
# e.g. /root/.ssh/bugs.debian.org
# and should be pasted to project settings manually
lxc file push 01genkeys.ipy rirror/root/
lxc exec rirror -- chmod +rx 01genkeys.ipy
lxc exec rirror -- ./01genkeys.ipy

echo "--- setting up daily jobber ---"
# set uid to 0 (root) to allow jobber load the file
lxc file push .jobber rirror/root/ --uid=0
lxc exec rirror -- jobber reload
