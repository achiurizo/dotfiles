return {
  {
    "zbirenbaum/copilot.lua",
    opts = function(_, opts)
      -- Enable Copilot LSP server for Sidekick integration
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.lsp.enable("copilot")
        end,
      })
      return opts
    end,
  },
}
