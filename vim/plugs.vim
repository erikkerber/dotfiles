" ========================================
" Vim plugin configuration
" ========================================
"
filetype off

set rtp+=~/.vim/plugs/ "Submodules
call plug#begin('~/.vim/plugged')

Plug 'keith/parsec.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'sjl/vitality.vim'
Plug 'gregsexton/gitv'
Plug 'mattn/gist-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'
Plug 'sheerun/vim-polyglot'
Plug 'honza/vim-snippets'
" Plug 'jtratner/vim-flavored-markdown.git'
" Plug 'scrooloose/syntastic.git'
Plug 'scrooloose/nerdcommenter'
Plug 'nelstrom/vim-markdown-preview'
Plug 'skwp/vim-html-escape'
Plug 'mxw/vim-jsx'
Plug 'jparise/vim-graphql'
Plug 'keith/swift.vim'
Plug 'keith/xcconfig.vim'
Plug 'tpope/vim-markdown'
Plug 'udalov/kotlin-vim'
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'gfontenot/vim-xcode'
Plug 'keith/gist.vim'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-commentary'
Plug 'neomake/neomake'
Plug 'wellle/targets.vim' # Several common text objects



runtime ruby.plugs
runtime languages.plugs
runtime git.plugs
runtime appearance.plugs
runtime textobjects.plugs
runtime search.plugs
runtime project.plugs
runtime tools.plugs
runtime vim-improvements.plugs

call plug#end()

filetype plugin indent on
