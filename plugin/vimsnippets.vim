" Expand on UltiSnips' configuration
"
if exists("b:done_vimsnippets_local")
   finish
endif
let b:done_vimsnippets_local = 1


" Some variables need default value
if !exists("g:snips_comment")
    let g:snips_comment = "username"
endif
