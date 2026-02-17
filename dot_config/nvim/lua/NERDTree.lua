vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-t>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-c>', ':NvimTreeCollapse<CR>', { noremap = true, silent = true })

-- netrw is disabled in init.lua (must happen before plugins load)
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    preserve_window_proportions = false,
  },
  actions = {
    open_file = {
      resize_window = false,
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
    custom = { "^bazel-" },
  },
})
