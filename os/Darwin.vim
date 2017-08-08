"
" --------------------------------------
if has("gui_running")
    if &background == "dark"
        hi normal guibg=black
    endif
    set guifont=Monaco:h12
    colorscheme blackboard
    set transparency=15
    let g:transparency = &transparency
    nnoremap gz :set fullscreen! columns=1000 transparency=0<cr>
endif
