
autocmd BufReadPre,FileReadPre *.gtmpl if &filetype == "" | setlocal ft=gotexttmpl | endif

"--------------------------------------------------------------------------
" END
"--------------------------------------------------------------------------
