return {
  {
    "keaising/im-select.nvim",
    event = "VeryLazy",
    opts = {
      default_im_select = "com.apple.keylayout.ABC",
      default_command = "macism",
    },
    config = function(_, opts)
      require("im_select").setup(opts)

      -- フォーカス取得時、ノーマル/コマンドモードなら IME を英語にリセット
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          local mode = vim.fn.mode()
          if mode == "n" or mode == "c" then
            vim.fn.system("macism com.apple.keylayout.ABC")
          end
        end,
      })
    end,
  },
}
