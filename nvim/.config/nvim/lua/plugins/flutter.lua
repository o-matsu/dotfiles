return {
  -- dart extra の dartls を無効化（flutter-tools が独自に管理するため）
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        dartls = { enabled = false },
      },
    },
  },

  -- Flutter 開発ツール
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    opts = {
      flutter_lookup_cmd = "asdf where flutter",
      widget_guides = { enabled = true },
      closing_tags = {
        enabled = true,
        prefix = "//",
      },
      dev_log = {
        enabled = true,
        open_cmd = "tabedit",
      },
      lsp = {
        color = {
          enabled = true,
          virtual_text = true,
        },
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          renameFilesWithClasses = "prompt",
          enableSnippets = true,
          updateImportsOnRename = true,
        },
      },
      debugger = {
        enabled = true,
        run_via_dap = true,
        exception_breakpoints = {},
      },
    },
    keys = {
      { "<leader>Fs", "<cmd>FlutterRun<cr>", desc = "Flutter Run" },
      { "<leader>Fd", "<cmd>FlutterDevices<cr>", desc = "Flutter Devices" },
      { "<leader>Fe", "<cmd>FlutterEmulators<cr>", desc = "Flutter Emulators" },
      { "<leader>Fr", "<cmd>FlutterReload<cr>", desc = "Flutter Reload" },
      { "<leader>FR", "<cmd>FlutterRestart<cr>", desc = "Flutter Restart" },
      { "<leader>Fq", "<cmd>FlutterQuit<cr>", desc = "Flutter Quit" },
      { "<leader>Fo", "<cmd>FlutterOutlineToggle<cr>", desc = "Flutter Outline" },
      { "<leader>Ft", "<cmd>FlutterDevTools<cr>", desc = "Flutter DevTools" },
      { "<leader>Fl", "<cmd>FlutterLogToggle<cr>", desc = "Flutter Log" },
    },
  },
}
