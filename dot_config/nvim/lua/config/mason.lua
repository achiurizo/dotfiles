return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rubocop",
        "ruby_lsp",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
}
