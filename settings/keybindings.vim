" keybindings
"-------------------------------------------------------------------------------
map <C-J> <C-W>j<C-W>_ " when editing muliple file with :sp you can switch between them
map <C-K> <C-W>k<C-W>_ " with <ctrl>-j and <ctrl>-k
map <C-N> <Esc>:!/usr/bin/perl -c %<cr>

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

