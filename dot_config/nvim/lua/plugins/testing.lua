return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-python",
      "marilari88/neotest-vitest",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {},
        ["neotest-vitest"] = {},
      },
    },
  },
}
