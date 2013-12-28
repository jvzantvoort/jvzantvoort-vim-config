if exists("b:did_ftplugin") | finish | endif
let b:did_ftplugin = 1

let python_highlight_builtins = 1
let python_highlight_exceptions = 1
let python_highlight_numbers = 1

colors molokai

set shiftwidth=4
set autoindent
set expandtab
set smarttab
set sts=4
set sw=4
set ts=4
set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
