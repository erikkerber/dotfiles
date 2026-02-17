local telescope = require('telescope')
telescope.setup{
  pickers = {
    find_files = {
      -- find_command = { 'rg', '--files', '--iglob', '!.git', '--no-ignore' },
      hidden = true,
    },
    grep_string = {
      additional_args = {"--hidden"}
    },
    live_grep = {
      additional_args = {"--hidden"},
      theme = "dropdown",
    },
  },
  defaults = {
    layout_config = {
      vertical = { width = 0.9 }
    },
  },
}

-- Set key mappings with options
local opts = { noremap = true, silent = true }

-- FZF.vim mappings (for commands Telescope doesn't replace)
vim.keymap.set('n', '<Leader>b', ':Buffers<CR>', opts)
vim.keymap.set('n', '<Leader>/', ':BLines<CR>', opts)
vim.keymap.set('n', '<Leader>\'', ':Marks<CR>', opts)
vim.keymap.set('n', '<Leader>H', ':Helptags<CR>', opts)
vim.keymap.set('n', '<Leader>hh', ':History<CR>', opts)
vim.keymap.set('n', '<Leader>h:', ':History:<CR>', opts)
vim.keymap.set('n', '<Leader>h/', ':History/<CR>', opts)

-- Telescope mappings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, opts)
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fl', builtin.git_files, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)
