#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# unminimize system (restore man pages)
yes | unminimize

# install packages
apt install -y gdb valgrind clang clang-format make git curl vim man-db manpages-dev ca-certificates openssh-client tzdata zsh --no-install-recommends

# configure timezone
ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

# download vim config
curl -o /root/.vimrc https://raw.githubusercontent.com/CIS548/gists/master/example_vimrc.txt

# download oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# change theme to *clean*
sed -i s/^ZSH_THEME=".\+"$/ZSH_THEME=\"clean\"/g ~/.zshrc

# add vscode config
mkdir -p /root/.vscode-server/data/Machine
echo {"terminal.integrated.defaultProfile.linux":"zsh"} > /root/.vscode-server/data/Machine/settings.json
