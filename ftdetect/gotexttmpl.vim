augroup vimrc
  " Remove all vimrc autocommands
  autocmd!
  autocmd BufReadPre,FileReadPre *.gtmpl if &filetype == "" | setlocal ft=gotexttmpl | endif
augroup END

