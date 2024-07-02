return {
  [1] = "tpope/vim-dispatch",
  lazy = false,
  keys = {
    { "<leader>di", "<Cmd>update | Dispatch<CR>" },
  },
  config = function()
    vim.g.dispatch_quickfix_height = 20
  end,
}
