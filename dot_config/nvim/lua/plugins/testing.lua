return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-python",
      "marilari88/neotest-vitest",
      "volodya-lombrozo/neotest-ruby-minitest",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {},
        ["neotest-vitest"] = {},
        ["neotest-ruby-minitest"] = {},
      },
    },
  },
}
