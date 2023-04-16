autocmd BufReadPre,FileReadPre *.asd if &filetype == "" | setlocal ft=asciidoc | endif
autocmd BufReadPre,FileReadPre *.asciidoc if &filetype == "" | setlocal ft=asciidoc | endif
