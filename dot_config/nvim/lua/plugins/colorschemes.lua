return {
    "sainnhe/everforest",
    "thedenisnikulin/vim-cyberpunk",
    "junegunn/seoul256.vim",
    "rebelot/kanagawa.nvim",
    "projekt0n/github-nvim-theme",
    {
        [1] = "roosta/vim-srcery",
        lazy = false,
        priority = 1000,
        config = function()
          vim.cmd("colorscheme srcery")
        end,
    },
}
