" ========================================
" Vim plugin configuration
" ========================================
"
filetype off

set rtp+=~/.vim/plugs/ "Submodules
set rtp+=/usr/local/bin/fzf

call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'gfontenot/vim-xcode'
Plug 'hrsh7th/nvim-cmp'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'neovim/nvim-lspconfig'
Plug 'keith/parsec.vim'
Plug 'keith/swift.vim'
Plug 'psliwka/vim-smoothie'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'

" telescope
Plug 'nvim-telescope/telescope.nvim'
" dependencies
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

" Archive (look back into after simplifying Vim life)
" Plug 'JazzCore/ctrlp-cmatcher'
" Plug 'airblade/vim-gitgutter'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'gregsexton/gitv'
" Plug 'honza/vim-snippets'
" Plug 'jparise/vim-graphql'
" Plug 'keith/gist.vim'
" Plug 'keith/xcconfig.vim'
" Plug 'machakann/vim-highlightedyank'
" Plug 'mattn/gist-vim'
" Plug 'mxw/vim-jsx'
" Plug 'nelstrom/vim-markdown-preview'
" Plug 'neomake/neomake'
" Plug 'sheerun/vim-polyglot'
" Plug 'sjl/vitality.vim'
" Plug 'skwp/vim-html-escape'
" Plug 'tommcdo/vim-lion'
" Plug 'tpope/vim-markdown'
" Plug 'tpope/vim-rhubarb'
" Plug 'udalov/kotlin-vim'
" Plug 'wellle/targets.vim'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-session'


" Reminder if I ever want to split these out
" runtime someplugs.plugs

call plug#end()

filetype plugin indent on
