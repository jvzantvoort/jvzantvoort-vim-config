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

augroup ro
  autocmd BufReadPost * call CheckRo()
augroup END

if &diff
  colorscheme molokai
endif
