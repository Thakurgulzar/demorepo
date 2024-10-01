#!/bin/bash
echo -e "\e[32mInstalling depends..."
apt install gnupg curl x11-repo -y > /dev/null 2>&1 

echo adding sources alienkrishn repo 
sleep 2
if [[ ! -d $PREFIX/etc/apt/sources.list.d ]]; then
  mkdir -p $PREFIX/etc/apt/sources.list.d > /dev/null 2>&1
fi  
echo "deb [trusted=yes arch=all] https://Thakurgulzar.github.io/demorepo demo main" > $PREFIX/etc/apt/sources.list.d/demorepo.list

echo -e "\e[32mAdding keys for Thakurgulzar repo\e[0m"
curl -sL https://raw.githubusercontent.com/Thakurgulzar/demorepo/main/apt-key | apt-key add
sleep 2

mv $PREFIX/etc/apt/trusted.gpg $PREFIX/etc/apt/trusted.gpg.d > /dev/null 2>&1

printf "\n 
demorepo Repo installed....
updating repositories...
"
apt update -y
