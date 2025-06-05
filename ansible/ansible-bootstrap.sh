#!/bin/bash
# Bootstrap Ansible Controller

# Update and upgrade packages
apt-get update -y
apt-get upgrade -y

# Set hostname
hostnamectl set-hostname ansible-controller

# Install Ansible and Git
apt-get install -y software-properties-common
add-apt-repository --yes --update ppa:ansible/ansible
apt-get install -y ansible git

# Optional: Create basic inventory structure
mkdir ~/ansible
cd ~/ansible
touch inventory.ini ansible.cfg
echo "lab" > inventory.ini
