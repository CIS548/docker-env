#!/bin/bash

# install llvm
apt-get update
apt-get -y upgrade
apt-get install -y wget

wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
wget -O /home/vagrant/.vimrc https://raw.githubusercontent.com/CIS380/gists/master/example_vimrc.txt

add-apt-repository ppa:jonathonf/vim
apt-add-repository "deb http://apt.llvm.org/focal/ llvm-toolchain-focal main"

apt-get update
apt-get -y upgrade
apt-get install -y emacs
apt-get install -y clang-6.0
apt-get install -y clang-format-6.0

update-alternatives --install /usr/bin/clang clang /usr/bin/clang-6.0 100
update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-6.0 100

apt-get install -y gdb
apt-get install -y lldb-3.8

apt-get install -y valgrind

apt-get install -y vim
# # PlugInstall can be comment out if you are in win10 and vagrant quit during the initilization.
vim -c PlugInstall -c qa

apt-get install -y tmux

apt-get install -y make
apt-get install -y gcc
apt-get install -y git
apt-get install python3.8