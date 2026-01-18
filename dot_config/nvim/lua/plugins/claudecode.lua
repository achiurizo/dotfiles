-- Override claudecode.nvim to use external terminal
-- Run Claude Code in a separate terminal (tmux pane, kitty window, etc.)
-- while still getting WebSocket server + Neovim tool integration
return {
  "coder/claudecode.nvim",
  opts = {
    terminal = {
      provider = "none", -- No UI actions; server + tools remain available
    },
  },
}
