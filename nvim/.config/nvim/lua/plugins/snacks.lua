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
    picker = {
      actions = {
        git_browse = function(_, item)
          Snacks.gitbrowse({ what = "commit", commit = item.commit })
        end,
      },
      sources = {
        git_log = {
          win = {
            input = {
              keys = {
                ["<C-o>"] = { "git_browse", mode = { "n", "i" } },
              },
            },
          },
        },
        git_log_file = {
          win = {
            input = {
              keys = {
                ["<C-o>"] = { "git_browse", mode = { "n", "i" } },
              },
            },
          },
        },
      },
    },
  },
}
