#!/bin/bash

echo -n "Checking dependencies... "

for name in gcc clang gdb valgrind git vim make tmux ifconfig unzip tar sudo man traceroute nslookup python3
do
  [[ $(which $name 2>/dev/null) ]] || { echo -en "\n$name needs to be installed. Use 'sudo apt-get install $name'";deps=1; }
done
[[ $deps -ne 1 ]] && echo "OK" || { echo -en "\nInstall the above and rerun this script\n";exit 1; }

# reference
# https://stackoverflow.com/questions/33297857/how-to-check-dependency-in-bash-script

