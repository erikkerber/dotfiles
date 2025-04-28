-- Map the leader key to <Space>
vim.keymap.set("n", "<Space>", "", {})
vim.g.mapleader = " "


local keyset = vim.keymap.set
keyset("n", "<leader>sr", ":%s/<<C-r><C-w>>//g<Left><Left>")

-- Switch to the last file
vim.keymap.set('n', '<leader><leader>', '<C-^>', {noremap = true})

-- Clear highlight after a search
vim.keymap.set('n', '<leader>c', ':let @/=""<CR>', {silent = true, noremap = true})

-- Save and Quit cheat codes
vim.keymap.set('n', 'Q', ':quit<CR>', {noremap = true})
vim.keymap.set('n', 'W', ':write<CR>', {noremap = true})

-- Delete without yanking
vim.keymap.set('n', '<leader>d', '"_d', {noremap = true})
vim.keymap.set('v', '<leader>d', '"_d', {noremap = true})

-- Replace currently selected text with default register without yanking it
vim.keymap.set('v', '<leader>p', '"_dP', {noremap = true})

-- Jump to definition
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {silent = true})
-- Open git commits with custom command ':Commits'
vim.keymap.set('n', '<Leader>g', ':Commits<CR>', {silent = true})
-- Jump to declaration
vim.keymap.set('n', '<leader>c', '<cmd>lua vim.lsp.buf.declaration()<CR>', {silent = true})
-- Find implementations
vim.keymap.set('n', '<leader>i', '<cmd>lua vim.lsp.buf.implementation()<CR>', {silent = true})
-- Find references
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {silent = true})
-- Set location list with diagnostics
vim.keymap.set('n', '<leader>l', '<cmd>lua vim.lsp.diagnostic.setloclist()<CR>', {silent = true})
-- Invoke code actions
vim.keymap.set('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', {silent = true})
-- Open diagnostic float
vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', {silent = true})
-- Formatting
vim.keymap.set('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', {silent = true})
-- Show hover
vim.keymap.set('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>', {silent = true})
-- Rename symbol
vim.keymap.set('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', {silent = true})

