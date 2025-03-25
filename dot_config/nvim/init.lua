-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("CopilotChat").setup({
  model = "claude-3.7-sonnet",
  prompts = {
    Local = {
      system_prompt = vim.fn.filereadable(".github/copilot-instructions.md") == 1
          and table.concat(vim.fn.readfile(".github/copilot-instructions.md"), "\n")
        or "follow best engineering practices like the KISS, DRY, and SOLID principles.",
      description = "Uses the local copilot-instructions.md context or a default prompt if unavailable",
    },

    Ask = {
      prompt = "/COPILOT_INSTRUCTIONS /Local please ask for help with the selected code.",
      description = "Ask for help with the selected code with the local context",
    },

    AddTests = {
      prompt = "/COPILOT_INSTRUCTIONS /Local please add tests for the selected code.",
      description = "Add tests to the selected code with the local context",
    },

    AddDocs = {
      prompt = "/COPILOT_INSTRUCTIONS /Local please add docs to the selected code.",
      description = "Add documentation to the selected code with the local context",
    },

    Refactor = {
      prompt = "/COPILOT_INSTRUCTIONS /Local please refactor the selected code.",
      description = "Refactor the selected code with the local context",
    },

    ExtractModule = {
      prompt = "/COPILOT_INSTRUCTIONS /Local please extract all related code into its own module from the selected code.",
      description = "Extract selected code into a module with the local context",
    },
  },
})
