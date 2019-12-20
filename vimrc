" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Source files before plugins
source ~/.vim/before/*.vim

" ================ General Config ====================

set shell=/bin/bash             "Bash
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

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on " Enable vim syntax highlighting as is (enable != on)

" Use space as leader!
let g:mapleader="\<Space>"

" I - Disable the startup message
" a - Avoid pressing enter after saves
" set shortmess=Ia
set shortmess=Ia

" Plugin setup
filetype off

" =============== Plugin Initialization ===============
" This loads all the plugins specified in ~/.vim/plugs.vim
if filereadable(expand("~/.vim/plugs.vim"))
  source ~/.vim/plugs.vim
endif
au BufNewFile,BufRead *.plugs set filetype=vim

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent                 " Indent the next line matching the previous line
set smartindent                " Smart auto-indent when creating a new line
set tabstop=2                  " Number of spaces each tab counts for
set shiftwidth=2               " The space << and >> moves the lines
set softtabstop=2              " Number of spaces for some tab operations
set shiftround                 " Round << and >> to multiples of shiftwidth
set expandtab                  " Insert spaces instead of actual tabs
set smarttab                   " Delete entire shiftwidth of tabs when they're inserted

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set wrap                    " Softwrap text
set linebreak               " Don't wrap in the middle of words

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
map <C-U> 20<C-Y>
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
augroup ft_settings
  autocmd!

  " Treat .ipas as .zip files
  autocmd BufReadCmd *.ipa call zip#Browse(expand("<amatch>"))

  " Set color column based on textwidth setting
  autocmd FileType * call s:SetColorColumn()
augroup END


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

set directory=$HOME/.tmp/vim/swap
call s:EnsureDirectory(&directory)

set viewdir=$HOME/.tmp/vim/view
call s:EnsureDirectory(&viewdir)

" On quit reset title
let &titleold=getcwd()

" ============== Color ========================
set background=dark
silent! colorscheme parsec

