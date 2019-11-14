#!/bin/bash

apt update
apt install -y apt-utils dialog
apt install -y openssh-server
apt install -y vim nano
apt install -y locales

sed -i 's/PermitRootLogin/#PermitRootLogin/g' /etc/ssh/sshd_config
echo -e "PermitRootLogin yes" | tee -a /etc/ssh/sshd_config

locale-gen en_US.UTF-8
update-locale
echo "LC_ALL=en_US.UTF-8" | tee -a /etc/default/locale
echo "LANGUAGE=en_US:en" | tee -a /etc/default/locale

service ssh start

history -c
