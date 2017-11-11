#### Adding new mirror on GitHub

1. Setup project and complete initial code import

* [ ] Create new project
* [ ] Set description to upstream repository address
* [ ] Import initial source code through UI
* [ ] Set URL to upstream development entrypoint

2. Login to worker node and link it to GitHub project

* [ ] Create `sync-*.sh` script in repository root
* [ ] Generate SSH [deploy key] for pushing code to mirror

      ./01genkeys.ipy


[deploy key]: https://developer.github.com/v3/guides/managing-deploy-keys/#deploy-keys
