-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("CopilotChat").setup({
  prompts = {
    MiniTest = {
      prompt = "/COPILOT_GENERATE please write tests in the minitest unit test style for this code.",
    },
  },
})
