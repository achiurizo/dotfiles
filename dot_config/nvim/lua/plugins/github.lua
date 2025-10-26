return {
  -- Existing: vim-rhubarb for :GBrowse

  -- Add: Telescope GitHub integration
  {
    "nvim-telescope/telescope-github.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("gh")
    end,
  },
}
