#!/bin/bash
BREW_FOUND="$(command -v brew)"
PYTHON3_FOUND="$(command -v python3)"
ANSIBLE_FOUND="$(command -v ansible)"
OS="$(uname)"

if [ "$OS" != "Darwin" ];
then
  echo "You are not using a MacOS, please check if we have the automation ready for your OS $OSTYPE"
  exit 1
fi

if [ -z "$BREW_FOUND" ]
then
  echo "BREW NOT FOUND"
  xcode-select --install
  # Install homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  echo "export HOMEBREW_NO_ANALYTICS=1" >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
  brew analytics off
else
  echo "BREW FOUND"
fi

if [ -z "$PYTHON3_FOUND" ]
then
  echo "PYTHON3 NOT FOUND"
  # Install Python 3
  brew install python
else
  echo "PYTHON3 FOUND"
fi

if [ -z "$ANSIBLE_FOUND" ]
then
  echo "ANSIBLE NOT FOUND"
  pip3 install --upgrade pip
  sudo pip3 install ansible
else
  echo "ANSIBLE FOUND"
fi

ansible-galaxy install -r requirements.yml

ansible-playbook -i hosts.ini main.yml