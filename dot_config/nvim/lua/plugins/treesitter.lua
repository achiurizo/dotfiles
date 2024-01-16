return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = { "elixir", "heex", "eex", "ruby", "typescript", },
          highlight = { 
            enable = true,
          },
        })
    end,
}
