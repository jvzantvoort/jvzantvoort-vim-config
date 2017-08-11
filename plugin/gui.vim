" T) Toolbar 
" r) Right handed toolbar always present
" R) Right handed toolbar always present in vsplit
" m) menu bar
" l) Left handed toolbar always present
" L) Left handed toolbar always present in vsplit
if has("gui_running")

  set guioptions-=T
  set guioptions-=r
  set guioptions-=R
  set guioptions-=m
  set guioptions-=l
  set guioptions-=L
  set guitablabel=%t

  " I don't like local languages in menu's
  " --------------------------------------
  set langmenu=en_US
  let $LANG = 'en_US'
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim

endif
