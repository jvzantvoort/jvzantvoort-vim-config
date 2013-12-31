"--------------------------------------------------------------------------
"
"         FILE:  .vim/settings/conway.vim
"
"  DESCRIPTION:  Some settings learned from Damian Conway's presentation.
"
"      CREATED:  Mon, 30 Dec 2013
"
"--------------------------------------------------------------------------

" set screen color scheme
function CheckRo()
  if &readonly
    color pablo
  endif
endfunction

au BufReadPost * call CheckRo()
"--------------------------------------------------------------------------
" END
"--------------------------------------------------------------------------
