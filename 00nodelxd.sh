echo --- creating rirror node ---
lxc launch ubuntu:z/amd64 rirror

echo --- installing updates ---
lxc exec rirror -- apt-get -y update
lxc exec rirror -- apt-get -y install unattended-upgrades
lxc exec rirror -- unattended-upgrades -v

echo --- installing git and jobber ---
lxc exec rirror -- apt-get -y install git
lxc exec rirror -- curl -LO https://github.com/dshearer/jobber/releases/download/v1.2/jobber_1.2-1_amd64.deb
lxc exec rirror -- dpkg -i jobber_1.2-1_amd64.deb 

echo --- generating key pair ---
lxc exec rirror -- ssh-keygen -f /root/.ssh/id_rsa -q -N ""
echo --- adding github.com to known_hosts ---
lxc exec rirror -- bash -c "ssh-keyscan github.com >> ~/.ssh/known_hosts"

echo --- downloading id_rsa.pub ---
lxc file pull rirror/root/.ssh/id_rsa.pub .

echo --- uploading sync scripts ---
lxc file push sync-packages.debian.org.sh rirror/root/
lxc exec rirror -- chmod +rx sync-packages.debian.org.sh 

echo --- setting up daily jobber ---
lxc file push .jobber rirror/root/
lxc exec rirror -- jobber reload
