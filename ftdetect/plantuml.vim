if did_filetype()
  finish
endif

autocmd BufRead,BufNewFile * :if getline(1) =~ '^.*startuml.*$'|  setfiletype plantuml | endif
autocmd BufRead,BufNewFile *.pu,*.uml,*.plantuml,*.tuml set filetype=plantuml
