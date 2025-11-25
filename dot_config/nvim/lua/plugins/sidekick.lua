return {
  {
    "folke/sidekick.nvim",
    opts = function(_, opts)
      local function set_transparent()
        -- Sidekick-specific highlights
        vim.api.nvim_set_hl(0, "SidekickNormal", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "SidekickBorder", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "SidekickTitle", { bg = "NONE" })
        -- Standard float highlights (sidekick uses these)
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "FloatTitle", { bg = "NONE" })
      end

      vim.api.nvim_create_autocmd("ColorScheme", { callback = set_transparent })
      set_transparent()

      -- Custom prompts
      opts.cli = opts.cli or {}
      opts.cli.prompts = vim.tbl_extend("force", opts.cli.prompts or {}, {
        -- Override existing prompts
        fix = "Fix {this}. Be concise.",

        -- Add new prompts
        refactor = "Refactor {this}: improve naming, reduce complexity, extract duplication. Preserve API and behavior.",
        types = "Add type annotations to {this}",
        debug = "Add debug logging to {this} for troubleshooting",
      })

      return opts
    end,
  },
}
