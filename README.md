# dotfiles

macOS 向けの個人用 dotfiles。[GNU Stow](https://www.gnu.org/software/stow/) でシンボリックリンクを管理しています。

## 構成

```
dotfiles/
├── install.sh          # セットアップスクリプト
├── skhd/
│   └── .config/skhd/
│       └── skhdrc      # skhd 設定
└── yabai/
    └── .config/yabai/
        └── yabairc     # yabai 設定
```

各ディレクトリが Stow の「パッケージ」に対応しています。パッケージ内のディレクトリ構成がそのまま `$HOME` 以下に展開されます。

## セットアップ

```bash
git clone git@github.com:o-matsu/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

`install.sh` は以下を自動で行います:

1. Homebrew が未インストールならインストール
2. GNU Stow が未インストールなら `brew install stow`
3. リポジトリ内のパッケージを自動検出して `stow` を実行
4. 競合する既存ファイルは `-YYYYMMDD.bak` にリネームして退避

## パッケージの追加方法

`$HOME/.config/foo/config.toml` を管理したい場合:

```bash
mkdir -p foo/.config/foo
mv ~/.config/foo/config.toml foo/.config/foo/
```

次回 `./install.sh` を実行すれば自動的にリンクされます。
