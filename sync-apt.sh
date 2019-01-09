#!/bin/bash
# Edit these variables for your project
PROJECT=apt
SOURCE=https://salsa.debian.org/apt-team/apt
TARGET=git@github.com:rirror/apt.git

# make sure deploy key is added to target repository
export GIT_SSH_COMMAND="ssh -i /root/.ssh/$PROJECT"

# skip git clone if directory exists
[[ -d $PROJECT ]] || git clone --mirror $SOURCE $PROJECT

git -C $PROJECT fetch -p
git -C $PROJECT push --mirror $TARGET
