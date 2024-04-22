local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('dracula/vim', { ['as'] = 'dracula' })
Plug('gfontenot/vim-xcode')
Plug('hrsh7th/nvim-cmp')
Plug('junegunn/fzf', { ['do'] = function()
  vim.fn['fzf#install']()
end })
Plug('junegunn/fzf.vim')
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-compe')
Plug('nvim-tree/nvim-tree.lua')
Plug('keith/lsp_spinner.nvim')
Plug('lvimuser/lsp-inlayhints.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
-- Plug('nvim-treesitter/playground')
Plug('keith/swift.vim')
Plug('psliwka/vim-smoothie')
Plug('tpope/vim-commentary')
Plug('tpope/vim-fugitive')
Plug('tpope/vim-git')
Plug('tpope/vim-rhubarb')
Plug('tpope/vim-surround')
Plug('vim-syntastic/syntastic')
Plug('nanotee/zoxide.vim')
Plug('nvim-telescope/telescope.nvim')
Plug('nvim-lua/plenary.nvim') -- telescope dependency

vim.call('plug#end')

-- Set the background to dark
vim.cmd('set background=dark')

-- Safely apply the Dracula colorscheme
vim.cmd('silent! colorscheme dracula')

