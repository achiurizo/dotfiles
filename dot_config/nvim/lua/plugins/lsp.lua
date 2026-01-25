return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Enable inlay hints for better type visibility
      inlay_hints = { enabled = true },

      servers = {
        tsserver = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayFunctionParameterTypeHints = true,
              },
            },
          },
        },
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic", -- "basic" vs "strict" for better performance
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
        ruby_lsp = {
          mason = false,
          cmd = { "mise", "exec", "--", "ruby-lsp" },
        },
        rubocop = { enabled = false },
      },
    },
  },
}
