#/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
export TZ="Asia/Seoul"

apt update && apt install -y \
  apt-utils \
  dialog \
  openssh-server \
  vim \
  nano \
  tmux \
  locales \
  tzdata

sed -i 's/PermitRootLogin/#PermitRootLogin/g' /etc/ssh/sshd_config
echo "PermitRootLogin yes" | tee -a /etc/ssh/sshd_config

locale-gen en_US.UTF-8
update-locale
echo "LC_ALL=en_US.UTF-8" | tee -a /etc/default/locale
echo "LANGUAGE=en_US:en" | tee -a /etc/default/locale

ln -fs /usr/share/zoneinfo/$TZ /etc/localtime
dpkg-reconfigure -f noninterative tzdata

service ssh start
