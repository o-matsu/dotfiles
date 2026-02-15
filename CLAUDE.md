# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

macOS向け個人dotfilesリポジトリ。[GNU Stow](https://www.gnu.org/software/stow/) でシンボリックリンクを管理し、各トップレベルディレクトリが Stow パッケージとして `$HOME` 以下に展開される。

## Setup & Installation

```bash
./install.sh
```

install.sh は Homebrew → GNU Stow の順にインストールし、リポジトリ内の全パッケージを自動検出して `stow -v -t "$HOME"` で展開する。既存ファイルは `-YYYYMMDD.bak` にリネームして退避される。

## Adding a New Package

`$HOME/.config/foo/config.toml` を管理したい場合:

```bash
mkdir -p foo/.config/foo
mv ~/.config/foo/config.toml foo/.config/foo/
```

ディレクトリ構造が `$HOME` からの相対パスと一致するようにする。次回 `./install.sh` で自動リンクされる。

## Architecture

### Stow パッケージ構成

各パッケージは `.config/<app>/` 配下に設定ファイルを持つ Stow パッケージ:

- **skhd** — macOS キーボードショートカットデーモン（yabai と連携）
- **yabai** — タイリングウィンドウマネージャ（BSP レイアウト、6px gaps）
- **yazi** — ターミナルファイルマネージャ（Lua プラグイン: smart-enter, smart-paste, git 等）
- **lazygit** — Git TUI（delta をページャとして利用、サイドバイサイド表示）
- **delta** — Git diff のシンタックスハイライト
- **nvim** — Neovim エディタ設定

### Neovim 設定 (AstroNvim v5)

プラグインマネージャは **Lazy.nvim**、ベースディストリビューションは **AstroNvim v5**。

エントリポイント: `nvim/.config/nvim/init.lua` → `lua/lazy_setup.lua`

主要な設定ファイル:
- `lua/lazy_setup.lua` — Lazy.nvim 初期化、mapleader=space, maplocalleader=","
- `lua/community.lua` — AstroCommunity パック（現在は **Dart** パックのみ有効）
- `lua/plugins/` — プラグイン設定群

プラグイン設定の注意点:
- `plugins/` 内の `astrocore.lua`, `astroui.lua`, `astrolsp.lua`, `mason.lua`, `treesitter.lua`, `none-ls.lua` は **テンプレートとして存在するが `if true then return {} end` で無効化されている**。有効化する場合はこのガードを削除する。
- `plugins/flutter-tools.lua` と `plugins/user.lua` はアクティブ。
- Flutter のパス解決に `asdf where flutter` を使用。

主要プラグイン: blink.cmp (補完), mason.nvim (LSP/ツール管理), neo-tree.nvim (ファイラ), snacks.nvim (ダッシュボード), flutter-tools.nvim, presence.nvim (Discord)
