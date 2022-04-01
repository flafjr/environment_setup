#!/bin/bash

if ! [ -x "$(python3 --version)" ]; then
  # Install Python 3
  brew install python
fi

if ! [ -x "$(ansible --version)" ]; then
  # Install Ansible
  sudo pip3 install ansible
fi

# Install homebrew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install Python 3
# brew install python

ansible-galaxy collection install community.crypto  # for SSH keys setup
ansible-galaxy collection install community.general # for git_config

ansible-playbook -i hosts.ini main.yml