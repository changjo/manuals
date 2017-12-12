#!/bin/bash

apt update && apt upgrade -y
apt install -y apt-utils dialog
apt install -y openssh-server
apt install -y sudo vim nano net-tools man
apt install -y locales

sed -i 's/PermitRootLogin/#PermitRootLogin/g' /etc/ssh/sshd_config
echo -e "PermitRootLogin yes" | tee -a /etc/ssh/sshd_config

locale-gen en_US.UTF-8
update-locale
echo "LC_ALL=en_US.UTF-8" | sudo tee -a /etc/default/locale
echo "LANGUAGE=en_US:en" | sudo tee -a /etc/default/locale

service ssh start

history -c
