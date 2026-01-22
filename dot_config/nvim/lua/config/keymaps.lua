-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Find files including ignored (.env, .gitignore, etc.)
vim.keymap.set("n", "<leader>fI", function()
  require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
end, { desc = "Find Files (incl. ignored)" })

-- Grep including ignored files
vim.keymap.set("n", "<leader>sI", function()
  require("telescope.builtin").live_grep({
    additional_args = { "--no-ignore", "--hidden" },
  })
end, { desc = "Grep (incl. ignored)" })
