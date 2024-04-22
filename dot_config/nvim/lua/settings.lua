-- General Config
vim.cmd('syntax enable')               -- Enable syntax highlighting

-- Short messages configuration to avoid startup message and pressing enter after saves
vim.opt.shortmess:append('Ia')

-- Shell configuration and other settings
-- vim.opt.shell = vim.env.SHELL          -- Use the shell specified in environment variable
vim.opt.number = true                  -- Enable line numbers
vim.opt.backspace = {'indent', 'eol', 'start'}  -- Configure backspace behavior
vim.opt.showcmd = true                 -- Show incomplete commands in the command area
vim.opt.showmode = true                -- Display the current mode
-- vim.opt.guicursor = 'a:blinkon0'       -- Disable cursor blink in all modes
vim.opt.belloff = 'all'                -- Turn off all bells
vim.opt.autoread = true                -- Automatically read files changed outside Neovim
vim.opt.wrap = false                   -- Do not wrap lines
vim.opt.linebreak = true               -- Wrap lines at convenient points (requires `wrap` to be enabled)
vim.opt.startofline = false            -- Do not move the cursor to the start of the line after certain commands
vim.opt.showmatch = true               -- Highlight matching brackets
vim.opt.errorbells = false             -- Disable error bells
vim.opt.title = true                   -- Set terminal's title
vim.opt.updatetime = 2000              -- Time before considering the user to be idle
vim.opt.display = 'lastline'           -- Ensure partial commands show up as last line
-- vim.opt.tags:prepend('.tags')          -- Prioritize local .tags files
vim.opt.signcolumn = 'number'          -- Show sign column integrated with number column

-- Indentation settings
vim.opt.autoindent = true          -- Indent the next line matching the previous line
vim.opt.smartindent = true         -- Smart auto-indent when creating a new line
vim.opt.tabstop = 2                -- Number of spaces each tab counts for
vim.opt.shiftwidth = 2             -- The space << and >> moves the lines
vim.opt.softtabstop = 2            -- Number of spaces for some tab operations
vim.opt.shiftround = true          -- Round << and >> to multiples of shiftwidth
vim.opt.expandtab = true           -- Insert spaces instead of actual tabs
vim.opt.smarttab = true            -- Delete entire shiftwidth of tabs when they're inserted
vim.opt.wrap = true                -- Soft wrap text
vim.opt.linebreak = true           -- Don't wrap in the middle of words

-- Scrolling settings
vim.opt.scrolloff = 8              -- Start scrolling when we're 8 lines away from margins
vim.opt.sidescrolloff = 15
vim.opt.sidescroll = 1

-- Search settings
vim.opt.incsearch = true           -- Find the next match as we type the search
vim.opt.hlsearch = true            -- Highlight searches by default
vim.opt.ignorecase = true          -- Ignore case when searching...
vim.opt.smartcase = true           -- ...unless we type a capital
-- vim.opt.infercase = true           -- Change behavior of completion since ignorecase is set
vim.opt.gdefault = true            -- Adds 'g' at the end of substitutions by default
