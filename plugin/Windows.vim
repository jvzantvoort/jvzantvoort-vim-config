"===============================================================================
"
"         FILE:  Windows.vim
"
"        USAGE:  Windows.vim
"
"  DESCRIPTION:  In Windows have the language default to english make the
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
if !(has('win32') || has('win64')) | finish | endif
if !has("gui_running")             | finish | endif

" set fonts and colors
" --------------------------------------
set guifont=Courier_New:h10:cANSI

" I don't like local languages in menu's
" --------------------------------------
set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" keyboard mappings
" --------------------------------------
map <silent> <C-F2> :if &guioptions =~# 'T' <Bar>
                         \set guioptions-=T <Bar>
                         \set guioptions-=m <Bar>
                     \else <Bar>
                         \set guioptions+=T <Bar>
                         \set guioptions+=m <Bar>
                     \endif<CR>

an 60.100 &Client.Note :call TakeNote()<CR>

