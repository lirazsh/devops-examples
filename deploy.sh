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

chmod 755 /etc/ansible/*

ssh-keygen -P "" -f /root/.ssh/id_rsa

do yes | ssh-copy-id 127.0.0.1
#-o StrictHostKeyChecking=false 

ansible-playbook /etc/ansible/playbooks/play.yml
#-e 'host_key_checking=False'
