" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Source files before plugins
source ~/.vim/before/*.vim

" =============== Plugin Initialization ===============
" This loads all the plugins specified in ~/.vim/plugs.vim

filetype off

if filereadable(expand("~/.vim/plugs.vim"))
  source ~/.vim/plugs.vim
endif
au BufNewFile,BufRead *.plugs set filetype=vim

" ================ General Config ====================

"turn on syntax highlighting
syntax on " Enable vim syntax highlighting as is (enable != on)

" I - Disable the startup message
" a - Avoid pressing enter after saves
" set shortmess=Ia

set shortmess=Ia
set shell=$SHELL                "Bash (or Fish!)
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set belloff=all
set autoread                    "Reload files changed outside vim
set nowrap                      "Don't wrap lines
set linebreak                   "Wrap lines at convenient points
set nostartofline               "Keep cursor in the same place after saves
set showmatch                   "Set show matching parenthesis
set noerrorbells                "Don't make noise
set title                       "Change the terminal's title
set updatetime=2000             "Set the time before plugins assume you're not typing
set display=lastline            "Display super long wrapped lines
set tags^=.tags                 "Add local .tags file

" Create a directory if it doesn't exist yet
function! s:EnsureDirectory(directory)
  if !isdirectory(expand(a:directory))
    call mkdir(expand(a:directory), 'p')
  endif
endfunction

" Save backup files, storage is cheap, losing changes is sad
set backup
set backupdir=$HOME/.tmp/vim/backup
call s:EnsureDirectory(&backupdir)

" Write undo tree to a file to resume from next time the file is opened
if has('persistent_undo')
  set undolevels=2000            " The number of undo items to remember
  set undofile                   " Save undo history to files locally
  set undodir=$HOME/.vimundo     " Set the directory of the undofile
  call s:EnsureDirectory(&undodir)
endif

set directory=$HOME/.tmp/vim/swap
call s:EnsureDirectory(&directory)

set viewdir=$HOME/.tmp/vim/view
call s:EnsureDirectory(&viewdir)

" Use space as leader
let g:mapleader="\<Space>"

" ================ Indentation ======================

set autoindent                 " Indent the next line matching the previous line
set smartindent                " Smart auto-indent when creating a new line
set tabstop=2                  " Number of spaces each tab counts for
set shiftwidth=2               " The space << and >> moves the lines
set softtabstop=2              " Number of spaces for some tab operations
set shiftround                 " Round << and >> to multiples of shiftwidth
set expandtab                  " Insert spaces instead of actual tabs
set smarttab                   " Delete entire shiftwidth of tabs when they're inserted
set wrap                    " Softwrap text
set linebreak               " Don't wrap in the middle of words

" ================= Remaps ===========================

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Switch to the last file
nnoremap <leader><leader> <C-^>

" Clear highlight after a search
nnoremap <silent> <leader>c :let @/=""<CR>

" Save and Quit cheat codes
nnoremap Q :quit<CR>
nnoremap W :write<CR>

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
set infercase       " Change behavior of completion since ignorecase is set
set gdefault        " Adds g at the end of substitutions by default

" ================ Clipboard ========================

if has('clipboard')     " If the feature is available
  set clipboard=unnamed " copy to the system clipboard

  if has('unnamedplus')
    set clipboard+=unnamedplus
  endif
endif

" ================ Column ===========================

function! s:SetColorColumn()
  if &textwidth == 0
    " Set colorcolumn specifically to 80 unless textwidth is set
    set colorcolumn=80
  else
    " Show a line past the text width
    set colorcolumn=+1
  endif
endfunction

" ============== Autocommand =======================

" https://vim.fandom.com/wiki/Highlight_current_line
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

augroup FileSettings
  " Set color column based on textwidth setting
  autocmd FileType * call s:SetColorColumn()

  " Don't auto insert a comment when using O/o for a newline
  autocmd VimEnter,BufRead,FileType * set formatoptions-=o
augroup end

" On quit reset title
let &titleold=getcwd()

" ============== Color ========================
set background=dark
silent! colorscheme parsec

