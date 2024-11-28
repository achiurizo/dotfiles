-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

local copilot_chat_buffer = function()
  local input = vim.fn.input("Quick Chat On Buffer: ")
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  end
end

map("n", "<leader>ab", copilot_chat_buffer, { desc = "CopilotChat - Quick chat on current buffer" })

local copilot_chat_visual = function()
  local input = vim.fn.input("Quick Chat On Visual: ")
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").visual })
  end
end

map("v", "<leader>av", copilot_chat_visual, { desc = "CopilotChat - Quick chat on visual selection" })
