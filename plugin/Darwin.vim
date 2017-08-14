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

if &term=~'xterm-256color' || &term=~'putty-256color' || &term=~'screen-256color' || has("gui_running")
    set laststatus=2
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    if !exists("g:airline_symbols")
      let g:airline_symbols = {}
    endif
    let g:airline_theme="luna"
    let g:airline_powerline_fonts=1
    let g:syntastic_error_symbol = '?'
    " let g:airline_symbols.space = "\ua0"
    let g:airline#extensions#branch#empty_message  =  "no .git"
    let g:airline#extensions#whitespace#enabled    =  0
    let g:airline#extensions#syntastic#enabled     =  1
    let g:airline#extensions#tabline#enabled       =  1
    let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
    let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
    let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter
    " let g:syntastic_error_symbol = '✘'
    " let g:syntastic_warning_symbol = "▲"
    let g:airline_powerline_fonts = 1
endif
