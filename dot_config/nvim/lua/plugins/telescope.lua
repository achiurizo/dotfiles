return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()

        local builtin = require('telescope.builtin')

        require("telescope").setup {
          pickers = {
            find_files = {
              find_command = { "fd", "--hidden", "--type", "f", "--strip-cwd-prefix", },
            }
          }
        }

        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>fm', builtin.marks, {})
        vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {})
        vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
        vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})
        vim.keymap.set('n', '<leader>fc', builtin.colorscheme, {})
    end,
}
