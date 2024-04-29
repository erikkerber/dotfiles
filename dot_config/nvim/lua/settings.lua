-- General Config
vim.cmd('syntax enable')               -- Enable syntax highlighting

-- Short messages configuration to avoid startup message and pressing enter after saves
vim.opt.shortmess:append('Ia')

-- Shell configuration and other settings
-- vim.opt.shell = vim.env.SHELL          -- Use the shell specified in environment variable

vim.opt.showmode = true                -- Display the current mode
-- vim.opt.guicursor = 'a:blinkon0'       -- Disable cursor blink in all modes
vim.opt.showmatch = true               -- Highlight matching brackets
vim.opt.errorbells = false             -- Disable error bells
vim.opt.title = true                   -- Set terminal's title
vim.opt.updatetime = 2000              -- Time before considering the user to be idle
vim.opt.signcolumn = 'number'          -- Show sign column integrated with number column

-- Indentation settings
vim.opt.smartindent = true         -- Smart auto-indent when creating a new line
vim.opt.tabstop = 4                -- Number of spaces each tab counts for
vim.opt.shiftwidth = 4             -- The space << and >> moves the lines
vim.opt.softtabstop = 4            -- Number of spaces for some tab operations
vim.opt.shiftround = true          -- Round << and >> to multiples of shiftwidth
vim.opt.expandtab = true           -- Insert spaces instead of actual tabs
vim.opt.wrap = true                -- Soft wrap text
vim.opt.linebreak = true           -- Don't wrap in the middle of words

-- Scrolling settings
vim.opt.scrolloff = 8              -- Start scrolling when we're 8 lines away from margins
vim.opt.sidescrolloff = 15

-- Search settings
vim.opt.ignorecase = true          -- Ignore case when searching...
vim.opt.smartcase = true           -- ...unless we type a capital
vim.opt.gdefault = true            -- Adds 'g' at the end of substitutions by default

-- ========= :checkhealth ============
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

