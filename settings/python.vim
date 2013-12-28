" some helpfull settings when coding python
"-------------------------------------------------------------------------------
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4

augroup python
    autocmd BufReadPre,FileReadPre      *.py let python_highlight_builtins = 1
    autocmd BufReadPre,FileReadPre      *.py let python_highlight_exceptions = 1
    autocmd BufReadPre,FileReadPre      *.py let python_highlight_numbers = 1
    autocmd BufReadPre,FileReadPre      *.py set autoindent
"   autocmd BufReadPre,FileReadPre      *.py set copyindent
    autocmd BufReadPre,FileReadPre      *.py set expandtab
    autocmd BufReadPre,FileReadPre      *.py set smarttab
    autocmd BufReadPre,FileReadPre      *.py set sts=4
    autocmd BufReadPre,FileReadPre      *.py set sw=4
    autocmd BufReadPre,FileReadPre      *.py set ts=4
    autocmd BufRead                     *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
augroup END
