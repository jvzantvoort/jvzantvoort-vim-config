if did_filetype()
  finish
endif

autocmd BufRead,BufNewFile *.irst set filetype=rst
