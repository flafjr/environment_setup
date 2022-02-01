#!/bin/bash

ansible-galaxy install -r requirements.yml
ansible-playbook -i hosts.ini main.yml