#!/bin/bash
PROJECT=bugs.debian.org
SOURCE=https://bugs.debian.org/debbugs-source/debbugs.git/
TARGET=git@github.com:rirror/bugs.debian.org.git

# skip git clone if directory exists
[[ -d $PROJECT ]] || git clone --mirror $SOURCE $PROJECT

git -C $PROJECT fetch -p
git -C $PROJECT push --mirror $TARGET
