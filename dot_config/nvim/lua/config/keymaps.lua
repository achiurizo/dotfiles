-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Find files including ignored (.env, .gitignore, etc.)
vim.keymap.set("n", "<leader>fI", function()
  Snacks.picker.files({ hidden = true, ignored = true })
end, { desc = "Find Files (incl. ignored)" })

-- Grep including ignored files
vim.keymap.set("n", "<leader>sI", function()
  Snacks.picker.grep({ hidden = true, ignored = true })
end, { desc = "Grep (incl. ignored)" })
