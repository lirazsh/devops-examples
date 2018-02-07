#!/bin/bash

yum update -y
yum install epel-release -y
yum install pip -y

pip install --upgrade pip -y

pip install ansible -y

yum install git -y

mkdir /etc/ansible

git init /etc/ansible

git clone http://github.com/lirazsh/devops-examples /etc/ansible

ssh-keygen -P "" -f /root/.ssh/id_rsa

ssh-copy-id localhost

/etc/ansible/playbooks/play.yml

