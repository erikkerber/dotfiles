" ========================================
" Vim plugin configuration
" ========================================
"
filetype off

set rtp+=~/.vim/plugs/ "Submodules
call plug#begin('~/.vim/plugged')

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
