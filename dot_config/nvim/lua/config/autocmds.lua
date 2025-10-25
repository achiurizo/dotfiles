-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Function to apply transparency settings
local function apply_transparency()
  -- Main windows
  vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, "NonText", { bg = "NONE", ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE", fg = "#6e6a86" })

  -- NeoTree (force, don't link)
  vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE", ctermbg = "NONE", force = true })
  vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE", ctermbg = "NONE", fg = "#6e6a86", force = true })
  vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "NONE", ctermbg = "NONE", force = true })
  vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { bg = "NONE", ctermbg = "NONE", force = true })

  -- Snacks explorer (force, don't link)
  vim.api.nvim_set_hl(0, "SnacksNormal", { bg = "NONE", ctermbg = "NONE", force = true })
  vim.api.nvim_set_hl(0, "SnacksNormalNC", { bg = "NONE", ctermbg = "NONE", fg = "#6e6a86", force = true })
  vim.api.nvim_set_hl(0, "SnacksWinBar", { bg = "NONE", ctermbg = "NONE", force = true })
  vim.api.nvim_set_hl(0, "SnacksWinBarNC", { bg = "NONE", ctermbg = "NONE", fg = "#6e6a86", force = true })

  -- Additional UI elements
  vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE", ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE", ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE" })
end

-- Apply after colorscheme loads
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = apply_transparency,
})

-- Apply after UI plugins load (with delay to ensure they've set their highlights)
vim.api.nvim_create_autocmd({ "VimEnter", "UIEnter" }, {
  callback = function()
    vim.defer_fn(apply_transparency, 100)
  end,
})
