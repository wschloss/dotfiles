#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SYMLINKS=(
  ".zshrc"
  ".zsh-plugins/prompt.zsh"
  ".vimrc"
  ".tmux.conf"
  ".ssh/config"
  ".config/ghostty/config"
  ".config/kitty/catppuccin-frappe.conf"
  ".config/kitty/kitty.conf"
)

link() {
  src="$REPO_DIR/$1"
  dest="$HOME/$1"

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "skipping $dest (already exists)"
    return
  fi

  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"
  echo "symlink $dest -> $src"
}

for item in "${SYMLINKS[@]}"; do
  link "$item"
done
