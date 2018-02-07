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

ssh-keygen -P "" -f /root/.ssh/id_rsa_ansible

ssh-keyscan -t rsa 127.0.0.1 >> /root/.ssh/known_hosts

ssh-copy-id 127.0.0.1

ansible-playbook /etc/ansible/playbooks/play.yml
#-e 'host_key_checking=False'
