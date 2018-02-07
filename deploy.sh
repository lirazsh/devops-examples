#!/bin/bash

yum update -y
yum install epel-release -y
yum install python-pip -y

pip install --upgrade pip

pip install ansible

yum install git -y

#mkdir /etc/ansible

#git init /etc/ansible

git clone http://github.com/lirazsh/devops-examples/ /etc/ansible

ssh-keygen -P "" -f /root/.ssh/id_rsa

mkdir /root/.ssh/authorized_keys

cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys/localhost.pub

ssh-copy-id localhost

/etc/ansible/playbooks/play.yml

