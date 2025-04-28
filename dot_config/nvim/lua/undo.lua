local function ensure_directory(directory)
  local expanded_dir = vim.fn.expand(directory)
  if vim.fn.isdirectory(expanded_dir) == 0 then
    vim.fn.mkdir(expanded_dir, "p")
  end
end

local keyset = vim.keymap.set
keyset("i", ",", ",<C-g>U")
keyset("i", ".", ".<C-g>U")
keyset("i", "!", "!<C-g>U")
keyset("i", "?", "?<C-g>U")

-- Enable backup and set backup directory
vim.opt.backup = true
local backup_dir = vim.fn.expand("$HOME/.tmp/vim/backup")
vim.opt.backupdir = backup_dir
ensure_directory(backup_dir)

-- Configure undofile settings if persistent_undo is available
if vim.fn.has('persistent_undo') == 1 then
  vim.opt.undolevels = 2000
  vim.opt.undofile = true
  local undo_dir = vim.fn.expand("$HOME/.vimundo")
  vim.opt.undodir = undo_dir
  ensure_directory(undo_dir)
end

-- Set and ensure the swap directory
local swap_dir = vim.fn.expand("$HOME/.tmp/vim/swap")
vim.opt.directory = swap_dir
ensure_directory(swap_dir)

-- Set and ensure the view directory
local view_dir = vim.fn.expand("$HOME/.tmp/vim/view")
vim.opt.viewdir = view_dir
ensure_directory(view_dir)
