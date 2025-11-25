return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      win = {
        list = {
          keys = {
            ["<C-x>"] = { "edit_vsplit", mode = { "n" } },
            ["<C-s>"] = { "edit_split", mode = { "n" } },
          },
        },
      },
    },
    picker = {
      win = {
        list = {
          keys = {
            ["<C-x>"] = { "edit_vsplit", mode = { "n", "i" } },
            ["<C-s>"] = { "edit_split", mode = { "n", "i" } },
          },
        },
      },
    },
  },
}
