

autocmd BufReadPre,FileReadPre *.asd if &filetype == "" | setlocal ft=asciidoc | endif
autocmd BufReadPre,FileReadPre *.asciidoc if &filetype == "" | setlocal ft=asciidoc | endif

autocmd BufReadPre,FileReadPre *.pl if &filetype == "" | setlocal ft=perl | endif
autocmd BufReadPre,FileReadPre *.pm if &filetype == "" | setlocal ft=perl | endif
