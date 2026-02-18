return {
  "folke/snacks.nvim",
  opts = {
    win = {
      keys = {
        -- FIXME: yabai/skhdと競合するのでdefault keymapを書き換えた
        -- cornixでキーに余裕ができたら戻したい。
        -- ["<M-h>"] = "none",
        -- ["<M-i>"] = "none",
        H = "toggle_hidden",
        I = "toggle_ignored",
      },
    },
  },
}
