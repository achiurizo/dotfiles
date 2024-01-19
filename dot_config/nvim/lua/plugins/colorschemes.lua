return {
    "sainnhe/everforest",
    "thedenisnikulin/vim-cyberpunk",
    "junegunn/seoul256.vim",
    "rebelot/kanagawa.nvim",
    "NLKNguyen/papercolor-theme",
    "roosta/vim-srcery",
    {
        [1] = "projekt0n/github-nvim-theme",
        lazy = false,
        priority = 1000,
        config = function()
          vim.cmd("colorscheme github_dark_colorblind")
        end,
    },
}
