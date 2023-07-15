if exists('b:did_ftplugin') | finish | endif
let b:did_ftplugin = 1

let python_highlight_builtins = 1
let python_highlight_exceptions = 1
let python_highlight_numbers = 1

augroup Linter
  autocmd FileType python compiler pylint
augroup END

setlocal autoindent
setlocal expandtab
setlocal shiftwidth=4
setlocal smarttab
setlocal softtabstop=4
setlocal tabstop=4
setlocal textwidth=79
setlocal fileformat=unix
setlocal errorformat=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

if v:version >= 800
  if executable('pyls')
      " pip install python-language-server
      au User lsp_setup call lsp#register_server({
          \ 'name': 'pyls',
          \ 'cmd': {server_info->['pyls']},
          \ 'whitelist': ['python'],
          \ })
  endif
endif
