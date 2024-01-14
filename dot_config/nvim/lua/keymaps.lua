local map = vim.keymap.set
-- find merge conflicts
map("n", "<leader>tc", "<ESC>/\\v^[<=>]{7}( .*\\|$)<CR>", {silent = true, noremap = true})
-- remove trailing whitespaces
map("n", "<leader>tw", "<Cmd>lua MiniTrailspace.trim()<CR>", {silent = true, noremap = true})
-- repeat last macro
map("n", "Q", "@@", { silent = true })
-- adjust viewports to the same size
map("n", "<leader>=", "<C-w>=", {silent = true, noremap = true})
-- remove highlights
map("n", "<C-l>", ":noh<cr>", {silent = true, noremap = true})
-- logical Y, yank from current to end of line
map({ "n", "x" }, "Y", "y$")
-- Allow for repeating commands in visual mode
map("x", ".", ":normal.<CR>", { silent = true })

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
map('n', '<space>e', vim.diagnostic.open_float)
map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
map('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    map('n', 'gD', vim.lsp.buf.declaration, opts)
    map('n', 'gd', vim.lsp.buf.definition, opts)
    map('n', 'K', vim.lsp.buf.hover, opts)
    map('n', 'gi', vim.lsp.buf.implementation, opts)
    map('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    map('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    map('n', '<space>D', vim.lsp.buf.type_definition, opts)
    map('n', '<space>rn', vim.lsp.buf.rename, opts)
    map({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    map('n', 'gr', vim.lsp.buf.references, opts)
    map('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
