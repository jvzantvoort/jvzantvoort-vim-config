"--------------------------------------------------------------------------
"
"         FILE:  .vim/settings/filetypes.vim
"
"  DESCRIPTION:  Some filetype enhancements
"
"      CREATED:  Mon, 30 Dec 2013
"
"--------------------------------------------------------------------------

autocmd BufReadPre,FileReadPre *.asd if &filetype == "" | setlocal ft=asciidoc | endif
autocmd BufReadPre,FileReadPre *.asciidoc if &filetype == "" | setlocal ft=asciidoc | endif

autocmd BufReadPre,FileReadPre *.pl if &filetype == "" | setlocal ft=perl | endif
autocmd BufReadPre,FileReadPre *.pm if &filetype == "" | setlocal ft=perl | endif

"--------------------------------------------------------------------------
" END
"--------------------------------------------------------------------------
