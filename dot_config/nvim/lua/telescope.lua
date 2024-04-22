-- Set key mappings with options
local opts = { noremap = true, silent = true }

-- Buffer and file navigation
vim.api.nvim_set_keymap('n', '<Leader>b', ':Buffers<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-p>', ':Files<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>f', ':Rg<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>/', ':BLines<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>\'', ':Marks<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<Leader>g', ':Commits<CR>', opts) -- Commented as in original
vim.api.nvim_set_keymap('n', '<Leader>H', ':Helptags<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>hh', ':History<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>h:', ':History:<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>h/', ':History/<CR>', opts)

-- Telescope mappings
vim.api.nvim_set_keymap('n', '<C-p>', "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fg', "<cmd>Telescope live_grep find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fb', "<cmd>Telescope buffers<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fh', "<cmd>Telescope help_tags<CR>", opts)

