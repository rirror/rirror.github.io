#!/bin/bash
PROJECT=packages.debian.org
SOURCE=git://anonscm.debian.org/webwml/packages.git
TARGET=git@github.com:rirror/packages.debian.org.git

git clone --mirror $SOURCE $PROJECT
git -C $PROJECT fetch -p
git -C $PROJECT push --mirror $TARGET
