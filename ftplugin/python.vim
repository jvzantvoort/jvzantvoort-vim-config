if exists("b:did_ftplugin") | finish | endif
let b:did_ftplugin = 1

let python_highlight_builtins = 1
let python_highlight_exceptions = 1
let python_highlight_numbers = 1

setlocal shiftwidth=4
setlocal autoindent
setlocal expandtab
setlocal smarttab
setlocal sts=4
setlocal sw=4
setlocal ts=4
setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
