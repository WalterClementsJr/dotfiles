#!/bin/bash

install_on_fedora() {
  sudo dnf install -y ansible
}

install_on_ubuntu() {
  sudo apt-get update
  sudo apt-get install -y ansible
}

install_on_mac() {
  brew install ansible
}

echo "Installing Ansible"

OS="$(uname -s)"

case "${OS}" in
Linux*)
  if [ -f /etc/fedora-release ]; then
    echo "Fedora detected"
    install_on_fedora
  elif [ -f /etc/lsb-release ]; then
    echo "Ubuntu detected"
    install_on_ubuntu
  else
    echo "Unsupported Linux distribution"
    exit 1
  fi
  ;;
Darwin*)
  echo "Mac detected"
  install_on_mac
  ;;
*)
  echo "Unsupported operating system: ${OS}"
  exit 1
  ;;
esac

ansible --version
echo "Ansible will begin setting up your machine"
ansible-playbook ~/.bootstrap/main.yml --ask-become-pass
echo "Ansible installation complete"
