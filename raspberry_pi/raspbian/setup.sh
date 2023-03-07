#!/bin/bash
# ANSIBLE_FOUND="$(command -v ansible)"
# OS="$(uname)"

# if [ "$OS" != "Linux" ];
# then
#   echo "You are not using a Pi, please check if we have the automation ready for your OS $OSTYPE"
#   exit 1
# fi

# if [ -z "$ANSIBLE_FOUND" ]
# then
#   echo "ANSIBLE NOT FOUND"
#   pip3 install --upgrade pip
#   sudo pip3 install ansible
# else
#   echo "ANSIBLE FOUND: $ANSIBLE_FOUND"
# fi

# # https://phoenixnap.com/kb/enable-ssh-raspberry-pi
# STATUS="$(systemctl is-active ssh)"
# if [ "${STATUS}" = "active" ]; then
#     echo "SSH is already active!"
# else 
#     sudo systemctl enable ssh
#     sudo systemctl start ssh  
# fi

# ansible-galaxy install -r requirements.yml
ansible-playbook -i hosts.ini main.yml