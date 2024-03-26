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
    {
        [1] = "sainnhe/everforest",
        lazy = false,
        priority = 1000,
        config = function()
          vim.opt.background = "light"
          vim.cmd("colorscheme everforest")
        end,
    },
}
