return {
  "NLKNguyen/papercolor-theme",
  "junegunn/seoul256.vim",
  "olimorris/onedarkpro.nvim",
  "rebelot/kanagawa.nvim",
  "roosta/vim-srcery",
  "rose-pine/neovim",
  "sainnhe/everforest",
  "sainnhe/gruvbox-material",
  "savq/melange-nvim",
  "thedenisnikulin/vim-cyberpunk",
  "projekt0n/github-nvim-theme",
  "Biscuit-Theme/nvim",
  "uhs-robert/oasis.nvim",
  {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("oasis").setup()
      vim.cmd([[
        colorscheme oasis-mirage
        set background=dark
      ]])
    end,
    -- you can set set configuration options here
    -- config = function()
    --     vim.g.zenbones_darken_comments = 45
    --     vim.cmd.colorscheme('zenbones')
    -- end
  },
}
