---@brief [[
--- Core Neovim settings configuration
--- Configures editor behavior, UI, search, and file handling
---@brief ]]

-- =====================================================
-- Performance and Compatibility Settings
-- =====================================================
vim.opt.updatetime = 300              -- Faster completion and better UX (default 4000ms)
vim.opt.timeoutlen = 500              -- Time to wait for mapped sequence to complete
vim.opt.hidden = true                 -- Allow switching buffers without saving
vim.opt.autoread = true               -- Auto reload files changed outside vim

-- Disable unused providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0

-- =====================================================
-- UI and Visual Settings
-- =====================================================
vim.opt.number = true                 -- Show line numbers
vim.opt.showmode = true               -- Show current mode in command line
vim.opt.showmatch = true              -- Highlight matching brackets
vim.opt.matchtime = 3                 -- Blink matching brackets for 0.3s
vim.opt.title = true                  -- Set terminal title
vim.opt.termguicolors = true         -- Enable 24-bit RGB colors
vim.opt.signcolumn = 'yes:1'         -- Always show sign column (prevents shift)
vim.opt.colorcolumn = '80,120'       -- Show column guides
vim.opt.cursorline = true            -- Highlight current line
vim.opt.list = true                  -- Show some invisible characters
vim.opt.listchars = {                -- Configure custom symbols for invisible chars
    tab = '→ ',
    trail = '·',
    extends = '»',
    precedes = '«',
    nbsp = '␣'
}

-- =====================================================
-- Editor Behavior
-- =====================================================
-- Indentation
vim.opt.smartindent = true           -- Smart auto-indenting
vim.opt.tabstop = 4                  -- Visual spaces per tab
vim.opt.shiftwidth = 4               -- Spaces for autoindent
vim.opt.softtabstop = 4              -- Spaces per tab when editing
vim.opt.shiftround = true            -- Round indent to multiple of shiftwidth
vim.opt.expandtab = true             -- Convert tabs to spaces

-- Text wrapping
vim.opt.wrap = true                  -- Soft wrap long lines
vim.opt.linebreak = true             -- Break at word boundaries
vim.opt.breakindent = true           -- Maintain indent when wrapping
vim.opt.showbreak = '↪ '             -- Show character at line breaks

-- Scrolling
vim.opt.scrolloff = 8                -- Lines of context above/below cursor
vim.opt.sidescrolloff = 15           -- Columns of context to the sides
vim.opt.sidescroll = 1               -- Smooth horizontal scrolling

-- =====================================================
-- Search and Replace
-- =====================================================
vim.opt.ignorecase = true            -- Case insensitive search...
vim.opt.smartcase = true             -- ...unless capital letter present
vim.opt.gdefault = true              -- Use 'g' flag by default with :s/foo/bar/
vim.opt.inccommand = "split"         -- Live preview of substitutions
vim.opt.hlsearch = true              -- Highlight search results
vim.opt.incsearch = true             -- Show matches while typing

-- =====================================================
-- File and Buffer Handling
-- =====================================================
-- File type specific settings
vim.opt.suffixesadd:append({
    '.java',
    '.rs',
    '.jsx',
    '.tsx',
    '.vue',
    '.md'
})

-- Ignore patterns for file operations
vim.opt.wildmode = {'list:longest', 'list:full'}
vim.opt.wildignorecase = true        -- Case insensitive completion
vim.opt.wildignore:append({
    -- Build artifacts
    '*.o', '*.obj', '*.dll', '*.exe', '*.so', '*.a', '*.lib', '*.class',
    -- Python
    '*.pyc', '*.pyo', '*.pyd', '__pycache__', '.pytest_cache',
    -- Java
    '.javac', 'target/', 'build/',
    -- JavaScript/Node
    'node_modules/', 'dist/', '.next/', 'build/',
    -- Version Control
    '.git/', '.hg/', '.svn/',
    -- IDE/Editor
    '.idea/', '.vscode/', '*.swp', '*.swo',
    -- LaTeX
    '*.aux', '*.out', '*.toc', '*.log',
    -- OS specific
    '.DS_Store', 'Thumbs.db'
})

-- Enable syntax highlighting with Treesitter if available
if vim.fn.has('nvim-0.8') == 1 then
    vim.opt.syntax = false  -- Disable old syntax for better performance
    vim.cmd([[
        if exists('g:loaded_treesitter')
            TSEnable highlight
        endif
    ]])
else
    vim.cmd('syntax enable')
end

-- Shortmess settings to reduce prompts
vim.opt.shortmess:append({
    I = true,  -- No intro message
    c = true,  -- Don't show ins-completion-menu messages
    C = true,  -- Don't show messages while scanning for ins-completion
    F = true,  -- Don't show file info when editing
    W = true,  -- Don't show "written" messages
    a = true,  -- Use abbreviations in messages
})
