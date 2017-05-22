echo --- creating rirror node ---
lxc launch ubuntu:z/amd64 rirror

echo --- installing updates ---
lxc exec rirror -- apt-get -y update
lxc exec rirror -- apt-get -y install unattended-upgrades
lxc exec rirror -- unattended-upgrades -v
lxc exec rirror -- apt-get -y install git

echo --- generating key pair ---
lxc exec rirror -- ssh-keygen -f /root/.ssh/id_rsa -q -N ""
echo --- adding github.com to known_hosts ---
lxc exec rirror -- bash -c "ssh-keyscan github.com >> ~/.ssh/known_hosts"

echo --- downloading id_rsa.pub ---
lxc file pull rirror/root/.ssh/id_rsa.pub .

echo --- uploading sync scripts ---
lxc file push sync-packages.debian.org.sh rirror/root/
lxc exec rirror -- chmod +rx sync-packages.debian.org.sh 
