#!bin/bash

echo "installing prerequesite softwares"

if [ $(yum list installed | cut -f1 -d" "| grep --extended '^java-1.8.0-openjdk.x86_64$' | wc -l) -eq 0 ]; then
  yum -y update
  yum -y install java 8
else
  echo "package installed"
fi

if [ $(yum list installed | cut -f1 -d" "| grep --extended '^git.x86_64$' | wc -l) -eq 0 ]; then
  yum -y update
  yum -y install git
else
  echo "package installed"
fi

if [ $(yum list installed | cut -f1 -d" "| grep --extended '^docker-ce.x86_64$' | wc -l) -eq 0 ]; then
  yum install -y yum-utils device-mapper-persistent-data lvm2
  yum-config-manager  --add-repo https://download.docker.com/linux/centos/docker-ce.repo
  yum -y install docker-ce
  systemctl enable docker
  systemctl start docker
else
  echo "package installed"
fi