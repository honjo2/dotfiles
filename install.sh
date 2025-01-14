#!/usr/bin/env bash

# install.shが置かれているディレクトリを取得
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Dotfiles Directory: ${DOTFILES_DIR}"

# カレントディレクトリ内の「.」で始まるファイル・フォルダを走査
for file in "${DOTFILES_DIR}"/.*; do
  # basename を取得
  filename="$(basename "$file")"

  # スキップするパターン（適宜追加・修正してください）
  case "$filename" in
    "." | ".." | ".git" | ".gitignore" | ".DS_Store")
      continue
      ;;
  esac

  # ホームディレクトリにシンボリックリンクを作る
  # -s シンボリックリンクを作成, -f 同名のリンクやファイルが存在する場合は強制的に上書き
  ln -sfv "$file" "$HOME/$filename"
done

echo "Done!"
