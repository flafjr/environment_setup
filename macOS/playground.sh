#!/bin/bash
ANSIBLE_FOUND="$(command -v ansible)"
OS="$(uname)"

if [ "$OS" != "Darwin" ];
then
  echo "You are not using a MacOS, please check if we have the automation ready for your OS $OSTYPE"
  exit 1
fi

if [ -z "$ANSIBLE_FOUND" ]
then
  echo "ANSIBLE NOT FOUND"
else
  echo "ANSIBLE FOUND: $ANSIBLE_FOUND"
fi