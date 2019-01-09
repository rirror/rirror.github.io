### Setup

`rirror` sync node is Ubuntu 18.10 LXD container, with
auto updates, but manual reboots.

1. Setup LXD client
2. Run `00nodelxd.sh` script that creates LXD container
   named `rirror` and bootstraps it

       ./00nodelxd.sh

3. Paste deploy keys shown on the screen to appropriate
   project repository settings

4. Test that `risync` job works as expected

       lxc exec rirror -- jobber test risync


### Changes

2019-01-09

- Updated to Ubuntu 18.10, jobber 1.3.4 and IPython3
- Use Ed25519 for deploy keys
- Limit rirror container to 1 CPU and 512MB RAM
- Debian source repos moved to Salsa (GitLab)

2017-11-11

- Added `docs/` with checklist for new projects (#9)
- Added https://github.com/rirror/apt for
  https://github.com/yakshaveinc/tasks/issues/11

2017-05-22

- Setup for automatic sync node on LXD (#7)

2017-03-16

- Created script for syncing Debian packages code (#6)

2017-03-15

- Added https://github.com/rirror/bugs.debian.org for
  https://github.com/techtonik/rainforce/issues/41

2017-01-15

- Created https://github.com/rirror/ on GitHub
- Added https://github.com/rirror/packages.debian.org for
  https://github.com/techtonik/rainforce/issues/39
