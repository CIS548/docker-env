#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# install prereqs
apt-get update
apt-get install -y apt-utils
apt-get install -y software-properties-common
apt-get install -y gnupg

# install llvm
apt-get -y upgrade
apt-get install -y wget
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
apt-add-repository "deb http://apt.llvm.org/jammy/ llvm-toolchain-jammy main"

# install text editors and terminals
add-apt-repository ppa:jonathonf/vim
apt-get update
apt-get -y upgrade
apt-get install -y emacs
# vim -c PlugInstall -c qa
apt-get install -y vim
apt-get install -y tmux

# debug tools
apt-get install -y gdb valgrind

# install C stuff
apt-get install -y gcc clang clang-format make


# network stuff
apt-get install -y net-tools
apt-get install iputils-ping
apt-get install -y traceroute

# install miscellaneous things I can't categorise
apt-get install -y lldb-3.8
apt-get install -y git-all
apt-get install -y curl
apt-get install -y sudo
apt-get install -y dnsutils
apt-get install -y zip

# prevent errors about no dialog installed when attempting to use apt inside container
apt-get install -y dialog

# install manpages
apt-get install -y man man-db manpages-posix manpages-dev manpages-posix-dev
apt-get install -y neofetch

