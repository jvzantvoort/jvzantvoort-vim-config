" header
"
"
" In Windows have the language default to english
" make the menubar toggle able and sum such
"

if !has("gui_running") | finish | endif

" if !has("win32") | finish | endif
set guifont=Courier_New:h10:cANSI

" I don't like local languages in menu's
set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

map <silent> <C-F2> :if &guioptions =~# 'T' <Bar>
                         \set guioptions-=T <Bar>
                         \set guioptions-=m <Bar>
                     \else <Bar>
                         \set guioptions+=T <Bar>
                         \set guioptions+=m <Bar>
                     \endif<CR>

an 60.100 &Client.Note :call TakeNote()<CR>

