" some helpfull settings when writing asciidoc
"    NOTE: I give my asciidoc files and '.asd' extension
"-------------------------------------------------------------------------------
augroup asciidoc
    au!
    autocmd BufReadPre,FileReadPre      *.asd set tw=68
    autocmd BufReadPre,FileReadPre      *.asd syn on
    autocmd BufReadPre,FileReadPre      *.asd set syntax=asciidoc
    autocmd BufReadPre,FileReadPre      *.asd setlocal spell spelllang=en_us
augroup END

