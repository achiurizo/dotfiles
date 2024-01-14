
local function edit_or_open()
  local api = require("nvim-tree.api")
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    -- expand or collapse folder
    api.node.open.edit()
  else
    -- open file
    api.node.open.edit()
    -- Close the tree if file was opened
    api.tree.close()
  end
end

-- open as vsplit on current node
local function vsplit_preview()
  local api = require("nvim-tree.api")
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    -- expand or collapse folder
    api.node.open.edit()
  else
    -- open file as vsplit
    api.node.open.vertical()
  end

  -- Finally refocus on tree if it was lost
  api.tree.focus()
end

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set("n", "l", edit_or_open,          opts("Edit Or Open"))
  vim.keymap.set("n", "L", vsplit_preview,        opts("Vsplit Preview"))
  vim.keymap.set("n", "h", api.tree.collapse_all, opts("Collapse All"))
  vim.keymap.set("n", "H", api.tree.close,        opts("Close"))
end

return {
  {
    "roosta/vim-srcery",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme srcery")
    end,
  },
  { "junegunn/fzf", dir = "~/.fzf", build = "./install --all" },
  {
    "nvimdev/indentmini.nvim",
    event = 'BufEnter',
    config = function()
        require('indentmini').setup()
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      --"nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {
        on_attach = my_on_attach,
        filters = { custom = { "^.git$" } },
        filesystem_watchers = {
          ignore_dirs = {
            "node_modules",
            ".git",
          },
        },
        renderer = {
          icons = {
            glyphs = {
              default = "📄",
              symlink = "🔗",
              folder = {
                default = "📁",
                open = "📂",
                arrow_open = "👉",
                arrow_closed = "👈",
                empty = "⚪",
                empty_open = "⚫",
              },
              git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "★",
              },
            },
          },
        },
      }
    end,
  },
  "github/copilot.vim",
  "liuchengxu/vista.vim",
}
