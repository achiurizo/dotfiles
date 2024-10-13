return {
  [1] = "tpope/vim-dispatch",
  lazy = false,
  keys = {
    { "<leader>dd", "<Cmd>update | Dispatch<CR>", desc = "Save and Dispatch" },
  },
  config = function()
    vim.g.dispatch_quickfix_height = 20
  end,
}
