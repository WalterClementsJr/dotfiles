#!/usr/bin/env bash
set -eo pipefail

install_on_fedora() {
  sudo dnf install -y git ansible python3-dnf
}

install_on_ubuntu() {
  sudo apt-get update
  sudo apt-get install -y git ansible python3-dnf
}

install_on_mac() {
  brew install git ansible
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

REPO_URL=${REPO_URL:"https://github.com/WalterClementsJr/dotfiles.git"}
DOTFILES_DIR="$HOME/dotfiles"

cd "$DOTFILES_DIR"

if [ -d "$DOTFILES_DIR/.git" ]; then
  echo "Updating existing dotfiles repo..."
  git -C "$DOTFILES_DIR" pull --ff-only
else
  echo "Cloning dotfiles repo into $DOTFILES_DIR..."
  git clone "$REPO_URL" "$DOTFILES_DIR"
fi

ansible --version
echo "Ansible will begin setting up your machine"
ansible-playbook ./ansible/main.yml -vvv --ask-become-pass
echo "Ansible installation complete"

# check stow
if ! command -v stow >/dev/null 2>&1; then
  echo "GNU Stow not found"
  exit 1
fi

# visual inspect then confirm
echo "Previewing Stow operation"
stow -nvt "$HOME" .
read -p "Proceed with Stow? [y/N] " -n 1 -r answer
echo

if [[ "$answer" =~ ^[Yy]$ ]]; then
  stow -vt "$HOME" .
  echo "Dotfiles installed successfully"
else
  echo "Aborted"
  exit 0
fi

