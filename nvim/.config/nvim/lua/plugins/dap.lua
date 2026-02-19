return {
  {
    "rcarriga/nvim-dap-ui",
    -- opts を関数として定義し、デフォルトの設定を拡張・上書きします
    opts = function(_, opts)
      -- レイアウトを定義し直して console を除外します
      opts.layouts = {
        {
          elements = {
            { id = "scopes", size = 0.3 },
            { id = "breakpoints", size = 0.35 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 0.1 },
          },
          position = "left",
          size = 40,
        },
        {
          elements = {
            -- console を消し、repl (ログが出る方) だけを配置
            { id = "repl", size = 1.0 },
          },
          position = "bottom",
          size = 10,
        },
      }
    end,
  },
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<leader>dv",
        function()
          require("dap").set_breakpoint(nil, nil, vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Log Breakpoint",
      },
    },
  },
}
