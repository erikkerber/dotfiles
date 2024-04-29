-- lazy.nvim pre-setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins


---
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
-- Plug('nvim-treesitter/nvim-treesitter', { ['branch'] = 'master', ['do'] = ':TSUpdate' })
Plug('nvim-treesitter/nvim-treesitter', { ['branch'] = 'master' })
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

-- Safely apply the Dracula colorscheme
vim.cmd('silent! colorscheme dracula')

