" some helpfull settings when coding python
"-------------------------------------------------------------------------------
augroup c
    autocmd BufReadPre,FileReadPre      *.c set expandtab
    autocmd BufReadPre,FileReadPre      *.c set autoindent
    autocmd BufReadPre,FileReadPre      *.c set copyindent
    autocmd BufReadPre,FileReadPre      *.c set sw=4
    autocmd BufReadPre,FileReadPre      *.c set ts=4
    autocmd BufReadPre,FileReadPre      *.c set sts=4
    autocmd BufReadPre,FileReadPre      *.c set smarttab
augroup END

