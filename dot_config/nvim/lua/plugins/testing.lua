return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-python",
      "marilari88/neotest-vitest",
      "zidhuss/neotest-minitest",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {},
        ["neotest-vitest"] = {},
        ["neotest-minitest"] = {},
      },
    },
  },
}
