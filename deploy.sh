#!/bin/bash

yum update -y
yum install epel-release -y || ( echo -e "failed to install epel-release" && exit 1 )
yum install python-pip -y || ( echo -e "failed to install python-pip" && exit 1 )

pip install --upgrade pip

# Install ansibe using python-pip
pip install ansible || ( echo -e "failed to install ansible" && exit 1 )

# Install git using python-pip
yum install git -y || ( echo -e "failed to install git" && exit 1 )

# Align permissions for /etc/ansible
chmod 755 /etc/ansible/* || ( echo "failed to correct permissions in /etc/ansible/" && exit 1 )

# Generate SSH key
ssh-keygen -P "" -f /root/.ssh/id_rsa || ( echo "failed to generate SSH key" && exit 1 )

# Add 127.0.0.1 to known hosts
ssh-keyscan -t rsa 127.0.0.1 >> /root/.ssh/known_hosts || ( echo "Failed adding 127.0.0.1 to known hosts" && exit 1 )

# Allow passwordless SSH to localhost (for ansible)
cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys || ( echo "failed setting up passwordless ssh" && exit 1 )

# Deploy ELK,NGINX,FILEBEAT in docker using Ansible
ansible-playbook /etc/ansible/playbooks/play.yml -v
