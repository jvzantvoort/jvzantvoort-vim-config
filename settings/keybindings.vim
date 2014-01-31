"--------------------------------------------------------------------------
"
"         FILE:  .vim/settings/keybindings.vim
"
"  DESCRIPTION:  Some usefull keybindings
"
"      CREATED:  Mon, 30 Dec 2013
"
"--------------------------------------------------------------------------

" when editing muliple file with :sp you can switch between them
" with <ctrl>-j and <ctrl>-k
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

nmap <leader>et :tabe %%
nmap <leader>n  :tabn<cr>
nmap <leader>p  :tabp<cr>

if version >= 700
  cnoremap %% <C-R>=expand('%:h').'/'<cr>
  nmap <leader>et :tabe %%
  nmap <leader>n  :tabn<cr>
  nmap <leader>p  :tabp<cr>
else
  cnoremap %% <C-R>=expand('%:h').'/'<cr>
  nmap <leader>et :sp %%
  nmap <leader>n  :wincmd j<cr>
  nmap <leader>p  :wincmd k<cr>
endif
nmap <leader>v :tabedit $HOME/.notes<CR>

nnoremap <C-e> :NERDTreeToggle<CR>

"--------------------------------------------------------------------------
" END
"--------------------------------------------------------------------------
