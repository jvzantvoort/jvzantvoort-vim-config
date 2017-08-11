"===============================================================================
"
"         FILE:  Darwin.vim
"
"        USAGE:  Darwin.vim
"
"  DESCRIPTION:  In Darwin have the language default to english make the
"                menubar toggle able and sum such
"
"      OPTIONS:  ---
" REQUIREMENTS:  ---
"         BUGS:  ---
"        NOTES:  ---
"       AUTHOR:  John van Zantvoort (jvzantvoort), John@vanZantvoort.org
"      COMPANY:  none
"      CREATED:  11-Aug-2017
"===============================================================================

" test for applicability
" --------------------------------------
if !has("gui_running")    | finish | endif
if !has("unix")           | finish | endif
let s:uname = substitute(system('uname -s'), "\n", "", "")
if !(s:uname == "Darwin") | finish | endif

" There is a debate wheter this works....
" if !has("macunix")        | finish | endif

if &background == "dark"
    hi normal guibg=black
endif

" set fonts and colors
" --------------------------------------
set guifont=Monaco:h12
colorscheme blackboard
set transparency=15
let g:transparency = &transparency
nnoremap gz :set fullscreen! columns=1000 transparency=0<cr>

" I don't like local languages in menu's
" --------------------------------------
set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

