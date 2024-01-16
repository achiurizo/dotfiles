return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = {
            "dockerfile",
            "elixir",
            "heex",
            "eex",
            "fish",
            "lua",
            "ruby",
            "javascript",
            "typescript",
          },
          highlight = {
            enable = true,
          },
        })
    end,
}
