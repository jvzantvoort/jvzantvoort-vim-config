" colorscheme blackboard
colorscheme molokai

function CheckRo()
    if &readonly
        colorscheme pablo
    else
        " colorscheme blackboard
        colorscheme molokai
    endif
endfunction
au BufReadPost * call CheckRo()

if &diff
  colorscheme molokai
endif
