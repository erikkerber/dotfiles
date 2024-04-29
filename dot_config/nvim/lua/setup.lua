-- Map the leader key to <Space>
vim.api.nvim_set_keymap("n", "<Space>", "", {})
vim.g.mapleader = " "

-- Switch to the last file
vim.api.nvim_set_keymap('n', '<leader><leader>', '<C-^>', {noremap = true})

-- Clear highlight after a search
vim.api.nvim_set_keymap('n', '<leader>c', ':let @/=""<CR>', {silent = true, noremap = true})

-- Save and Quit cheat codes
vim.api.nvim_set_keymap('n', 'Q', ':quit<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'W', ':write<CR>', {noremap = true})

-- Delete without yanking
vim.api.nvim_set_keymap('n', '<leader>d', '"_d', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>d', '"_d', {noremap = true})

-- Replace currently selected text with default register without yanking it
vim.api.nvim_set_keymap('v', '<leader>p', '"_dP', {noremap = true})

-- Jump to definition
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {silent = true})
-- Open git commits with custom command ':Commits'
vim.api.nvim_set_keymap('n', '<Leader>g', ':Commits<CR>', {silent = true})
-- Jump to declaration
vim.api.nvim_set_keymap('n', '<leader>c', '<cmd>lua vim.lsp.buf.declaration()<CR>', {silent = true})
-- Find implementations
vim.api.nvim_set_keymap('n', '<leader>i', '<cmd>lua vim.lsp.buf.implementation()<CR>', {silent = true})
-- Find references
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {silent = true})
-- Set location list with diagnostics
vim.api.nvim_set_keymap('n', '<leader>l', '<cmd>lua vim.lsp.diagnostic.setloclist()<CR>', {silent = true})
-- Invoke code actions
vim.api.nvim_set_keymap('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', {silent = true})
-- Open diagnostic float
vim.api.nvim_set_keymap('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', {silent = true})
-- Formatting
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', {silent = true})
-- Show hover
vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>', {silent = true})
-- Rename symbol
vim.api.nvim_set_keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', {silent = true})

