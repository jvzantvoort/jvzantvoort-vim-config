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
" set guifont=Monaco:h12
set guifont=Source\ Code\ Pro\ for\ Powerline:h12
set transparency=15
let g:transparency = &transparency
nnoremap gz :set fullscreen! columns=1000 transparency=0<cr>

