#!/bin/bash

# dotfiles ディレクトリのパス
DOTFILES_DIR=$(cd "$(dirname "$0")" && pwd)

# ドットで始まる全てのファイルを取得 (除外リストも適用)
EXCLUDE_FILES=(. .. .git .gitignore)  # 除外するファイル/ディレクトリ
FILES=$(find "$DOTFILES_DIR" -maxdepth 1 -type f -name ".*" | while read -r file; do
    basename "$file"
done | grep -vFx "${EXCLUDE_FILES[@]}")

# シンボリックリンクを作成する関数
create_symlink() {
    local src=$1
    local dest=$2

    if [ -L "$dest" ]; then
        echo "既存のシンボリックリンクを確認: $dest"
    elif [ -e "$dest" ]; then
        echo "既存のファイル/ディレクトリをバックアップ: $dest -> ${dest}.bak"
        mv "$dest" "${dest}.bak"
    fi

    ln -s "$src" "$dest"
    echo "シンボリックリンク作成: $src -> $dest"
}

# ファイルごとに処理
for file in $FILES; do
    src="$DOTFILES_DIR/$file"
    dest="$HOME/$file"
    create_symlink "$src" "$dest"
done

echo "全てのシンボリックリンクが作成されました！"
