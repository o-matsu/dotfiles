# Keyboard Shortcuts

macOS ショートカットキー統一設計。Vim 風 hjkl 軸で skhd(yabai), cmux(Ghostty), Raycast を横断的に整理。

## 設計原則

1. **修飾キー = スコープ** — `alt` = OS層、`cmd+alt` = ターミナル層
2. **キーで操作対象を区別** — `j/k` = 要素間、`h/l` = グループ間、`,/.` = 上位グループ間
3. **+ shift = 変更操作**（移動/スワップ/リサイズ）、shift なし = 参照操作（フォーカス）
4. **ctrl 回避** — MacBook 本体で押しづらいため、キーボード必須の操作には使わない
5. **数字・括弧回避** — Cornix (48キー) でレイヤー経由になるため、頻繁な操作には使わない

## ハードウェア

| 環境 | キーボード | 備考 |
|---|---|---|
| 自宅 | Cornix 48キー分離 (US) | 数字・矢印・括弧はレイヤー経由。`,` `.` はベースレイヤー |
| 外出先 | MacBook 本体 (US) | トラックパッド併用。ウィンドウ操作はトラックパッドで代替可 |
| 共通 | alt = CapsLock に OS レベルで割当 | 小指でアクセス良好 |

## 構造の対称性

```
              j/k (要素間)         h/l (グループ間)      ,/. (上位グループ)
OS    (alt)   ウィンドウ next/prev  スペース prev/next     —
Terminal      ペイン next/prev     サーフェス prev/next    ワークスペース prev/next
(cmd+alt)
```

## チートシート

```
═══ OS ウィンドウ (skhd/yabai) ═════════════════
alt + j/k               ウィンドウ next/prev
alt + h/l               スペース prev/next
alt + shift + j/k       ウィンドウ スワップ
alt + shift + h/l       スペース間 移動
ctrl + shift + hjkl     リサイズ (※外出先はトラックパッド)
alt + f                 フルスクリーン
alt + shift + f         フロート切替
alt + m                 Y軸ミラー
alt + shift + m         Mission Control
cmd + alt + shift + f   bsp/stack 切替

═══ ターミナル (cmux/Ghostty) ═══════════════════
cmd + alt + j/k         ペイン next/prev          [ghostty config]
cmd + alt + h/l         サーフェス prev/next       [cmux Settings]
cmd + alt + , / .       ワークスペース prev/next   [cmux Settings]
cmd + d                 右に分割
cmd + shift + d         下に分割
cmd + t                 新規サーフェス

═══ アプリ切替 (Raycast Hotkey) ═════════════════
alt + t                 cmux (Terminal)
alt + c                 Chrome
alt + s                 Slack

═══ その他 ══════════════════════════════════════
alt + v                 Wispr Flow (音声入力)
```

## 設定ファイルの対応

| ショートカット | 設定場所 | dotfiles 管理 |
|---|---|---|
| OS ウィンドウ操作 | `skhd/.config/skhd/skhdrc` | ○ |
| ペイン操作 | `ghostty/.config/ghostty/config` | ○ |
| サーフェス(タブ)切替 | cmux Settings (GUI: `cmd+,`) | × |
| ワークスペース切替 | cmux Settings (GUI: `cmd+,`) | × |
| アプリ切替 | Raycast Settings (GUI) | × |

## Cornix 親指キー推奨配置

```
左手親指: [ Alt ] [ Cmd ] [ Layer ]
右手親指: [ Shift ] [ Space ] [ Enter ]
```

`Cmd+Alt` をワンキー発動するコンボキーを親指に割り当てると、ペイン/タブ操作が 2 キーで済む。
