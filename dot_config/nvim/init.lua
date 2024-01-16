local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","

require("lazy").setup("plugins", {
    git = {
      timeout = 480
    }
})

-- disable netrw at the very start of your init.lua
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors  = true
vim.opt.background     = "dark"
vim.opt.clipboard      = "unnamedplus"
vim.opt.number         = true
vim.opt.relativenumber = false
vim.opt.wrap           = false
vim.opt.cursorline     = true
vim.opt.signcolumn     = "yes"
vim.opt.updatetime     = 300
vim.opt.tabstop        = 2
vim.opt.softtabstop    = 2
vim.opt.shiftwidth     = 2
vim.opt.expandtab      = true
vim.opt.shiftround     = true
-- Setup smarter search settings
vim.opt.ignorecase = true
vim.opt.smartcase  = true
vim.opt.hlsearch   = true
-- Use global statusline
vim.opt.laststatus = 3
-- Redraw the screen less during computationally intensive tasks
vim.opt.lazyredraw = true
-- Force vertical splits to always open on the right
vim.opt.splitright = true

-- live dariningly
vim.opt.swapfile = false

-- Setup folding
vim.opt.foldenable     = true
vim.opt.foldmethod     = "expr"
vim.opt.foldexpr       = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 2

require("keymaps")
