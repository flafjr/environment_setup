#!/bin/bash
OS=$(uname -s)
BREW_FOUND="$(command -v brew)"
PYTHON3_FOUND="$(command -v python3)"
ANSIBLE_FOUND="$(command -v ansible)"

if [ "$OS" = "Darwin" ]; then
    echo "macOS"
elif [ "$OS" = "Linux" ]; then
    echo "Linux"
elif echo "$OS" | grep -qE "CYGWIN|MINGW|MSYS"; then
    echo "Windows"
else
    echo "Unknown OS: $OS"
fi

# TODO: Check if brew is installed
# xcode-select --install
# /usr/sbin/softwareupdate --install-rosetta --agree-to-license
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# https://opensource.com/article/19/5/python-3-default-mac
# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/aws/aws.plugin.zsh

if [ "$OS" = "Darwin" ] && [ -z "$BREW_FOUND" ]; then
  echo "BREW NOT FOUND"
  xcode-select --install
  # Install homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  echo "export HOMEBREW_NO_ANALYTICS=1" >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
  brew analytics off
else
  echo "Brew Found or Not needed!"
fi

if [ "$OS" = "Darwin" ] && [ -z "$PYTHON3_FOUND" ]; then
  echo "PYTHON3 NOT FOUND"
  # Install Python 3
  brew install python
else
  echo "Python Found"
fi

if [ "$OS" = "Darwin" ] && [ -z "$ANSIBLE_FOUND" ]; then
  python3 -m ensurepip --upgrade
  echo "ANSIBLE NOT FOUND"
  pip install --upgrade pip
  sudo pip install ansible
else
  echo "ANSIBLE FOUND"
fi

# ansible-galaxy install -r requirements.yml

# https://www.shellhacks.com/ansible-sudo-a-password-is-required/
# ansible-playbook -i hosts.ini main.yml --ask-become-pass
