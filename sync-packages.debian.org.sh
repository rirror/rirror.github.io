#!/bin/bash
PROJECT=packages.debian.org
SOURCE=git://anonscm.debian.org/webwml/packages.git
TARGET=git@github.com:rirror/packages.debian.org.git

# make sure deploy key is added to target repository
export GIT_SSH_COMMAND="ssh -i /root/.ssh/$PROJECT"

# skip git clone if directory exists
[[ -d $PROJECT ]] || git clone --mirror $SOURCE $PROJECT

git -C $PROJECT fetch -p
git -C $PROJECT push --mirror $TARGET
