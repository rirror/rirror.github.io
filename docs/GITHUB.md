#### Adding new mirror on GitHub

PROJECT=

1. Setup project and complete initial code import

* [ ] Create new project
* [ ] Set description to upstream repository address
* [ ] Add `mirror` tag
* [ ] Import initial source code through UI
* [ ] Set URL to upstream development entrypoint

2. Login to worker node and link it to GitHub project

* [ ] Create `sync-*.sh` script in repository root
```
#!/bin/bash
# Edit these variables for your project
PROJECT=packages.debian.org
SOURCE=git://anonscm.debian.org/webwml/packages.git
TARGET=git@github.com:rirror/packages.debian.org.git

# make sure deploy key is added to target repository
export GIT_SSH_COMMAND="ssh -i /root/.ssh/$PROJECT"

# skip git clone if directory exists
[[ -d $PROJECT ]] || git clone --mirror $SOURCE $PROJECT

git -C $PROJECT fetch -p
git -C $PROJECT push --mirror $TARGET
```

* [ ] Generate SSH [deploy key] for pushing code to mirror
```
./01genkeys.ipy
```
* [ ] Add [deploy key] with write access to https://github.com/rirror/$PROJECT/settings/keys

[deploy key]: https://developer.github.com/v3/guides/managing-deploy-keys/#deploy-keys
