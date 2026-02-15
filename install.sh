#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_SUFFIX="-$(date +%Y%m%d).bak"

# Homebrew
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# stow
if ! command -v stow &>/dev/null; then
  echo "Installing stow..."
  brew install stow
fi

cd "$DOTFILES_DIR"

backups=()

# 各パッケージを自動検出してstow
for dir in */; do
  package="${dir%/}"

  # パッケージ内のファイルを走査し、競合する既存ファイルをバックアップ
  while IFS= read -r -d '' file; do
    rel="${file#"$DOTFILES_DIR/$package/"}"
    target="$HOME/$rel"
    if [ -e "$target" ] && [ ! -L "$target" ]; then
      mv "$target" "${target}${BACKUP_SUFFIX}"
      backups+=("$target → ${target}${BACKUP_SUFFIX}")
    elif [ -L "$target" ]; then
      rm "$target"
    fi
  done < <(find "$DOTFILES_DIR/$package" -type f -print0)

  echo "Stowing $package..."
  stow --no-folding -v -t "$HOME" "$package"
done

if [ ${#backups[@]} -gt 0 ]; then
  echo ""
  echo "Backed up existing files:"
  for entry in "${backups[@]}"; do
    echo "  $entry"
  done
fi

echo ""
echo "Done!"
