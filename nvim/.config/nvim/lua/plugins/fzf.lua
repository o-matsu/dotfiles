return {
  "ibhagwan/fzf-lua",
  opts = {
    defaults = {
      actions = {
        -- FIXME: yabai/と競合するのでdefault keymapを書き換えた
        -- cornixでキーに余裕ができたら戻したい。
        ["alt-h"] = false,
        ["alt-i"] = false,
        ["ctrl-h"] = { require("fzf-lua").actions.toggle_hidden },
        ["ctrl-i"] = { require("fzf-lua").actions.toggle_ignore },
      },
    },
  },
}
