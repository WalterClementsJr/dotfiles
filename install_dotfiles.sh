#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/WalterClementsJr/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"

if [ -d "$DOTFILES_DIR/.git" ]; then
    echo "Updating existing dotfiles repo..."
    git -C "$DOTFILES_DIR" pull --ff-only
else
    echo "Cloning dotfiles repo into $DOTFILES_DIR..."
    git clone "$REPO_URL" "$DOTFILES_DIR"
fi

cd "$DOTFILES_DIR"

# === Make sure stow is installed ===
if ! command -v stow >/dev/null 2>&1; then
    echo "GNU Stow not found"
    exit 1
fi

# visual inspect then confirm
echo "🔍 Previewing Stow operation..."
stow -nvt "$HOME" .
read -rp "Proceed with actual stow? [y/N] " answer

if [[ "$answer" =~ ^[Yy]$ ]]; then
    stow -vt "$HOME" .
    echo "Dotfiles installed successfully!"
else
    echo "Aborted."
    exit 0
fi
