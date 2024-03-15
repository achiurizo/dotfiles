return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = {
            "angular",
            "dockerfile",
            "elixir",
            "heex",
            "eex",
            "fish",
            "lua",
            "markdown",
            "ruby",
            "sql",
            "javascript",
            "typescript",
            "vimdoc",
          },
          highlight = {
            enable = true,
          },
        })
    end,
}
