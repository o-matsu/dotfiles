#!/usr/bin/env sh
# 外部ディスプレイなし(=1枚) → float、あり → bsp
# display_added / display_removed シグナルと yabairc 起動時に呼ばれる

if [ "$(yabai -m query --displays | jq length)" -eq 1 ]; then
  layout=float
else
  layout=bsp
fi

yabai -m config layout "$layout"                 # 新規 Space のデフォルト
# 既存 Space にも適用 (macOS ネイティブのフルスクリーン Space は変更不可なので除外)
for s in $(yabai -m query --spaces | jq '.[] | select(.["is-native-fullscreen"] | not) | .index'); do
  yabai -m space "$s" --layout "$layout"
done
