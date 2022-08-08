#!/bin/bash
ANSIBLE_FOUND="$(command -v ansible)"
OS="$(uname)" #TODO Improve
# https://phoenixnap.com/kb/enable-ssh-raspberry-pi

if [ "$OS" != "Linux" ];
then
  echo "You are not using a Pi, please check if we have the automation ready for your OS $OSTYPE"
  exit 1
fi

if [ -z "$ANSIBLE_FOUND" ]
then
  echo "ANSIBLE NOT FOUND"
  pip3 install --upgrade pip
  sudo pip3 install ansible
else
  echo "ANSIBLE FOUND: $ANSIBLE_FOUND"
fi

ansible-galaxy install -r requirements.yml
ansible-playbook -i hosts.ini main.yml