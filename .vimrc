" ==============================================================================
"
"         FILE:  ~/.vimrc
"
"  DESCRIPTION:  My current vimrc
"
"      VERSION:  1.0
"      CREATED:  05/30/2012 11:00:30 AM
"
" ==============================================================================

" Pathogen load
filetype off

filetype plugin indent on

let g:pymode_folding = 0

" General settings
"-------------------------------------------------------------------------------
colors murphy

"-------------------------------------------------------------------------------
" backspace:             specifies what <BS>, CTRL-W, etc. can do in Insert mode
set bs=2

" whichwrap:        list of flags specifying which commands wrap to another line
set ww=[,]

" winminheight:                      minimal number of lines used for any window
set wmh=0
set wmw=0

" history:                                 how many command lines are remembered 
set hi=50

" ruler:                                  show cursor position below each window
set ru

" showcmd:                        show (partial) command keys in the status line
set sc

" incsearch:                          show match for partly typed search command
set is

" number:                                     show the line number for each line
set nu

" backupext:                             file name extension for the backup file
" exec 'set bex=' . expand(strftime("_jvz:%Y%m%d_%H%M"))

set nobackup                   " do not keep a backup file, use versions instead

set nocompatible     
"-------------------------------------------------------------------------------

" disable beep and flash
set vb t_vb=

" I don't like search highlighting
set nohls

" keybindings
"-------------------------------------------------------------------------------
map <C-J> <C-W>j<C-W>_ " when editing muliple file with :sp you can switch between them
map <C-K> <C-W>k<C-W>_ " with <ctrl>-j and <ctrl>-k
map <C-N> <Esc>:!/usr/bin/perl -c %<cr>
nmap <silent> <leader>q :wq<cr>
nmap <leader>d :NERDTreeToggle<CR>


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

" Abbreviations
"-------------------------------------------------------------------------------
iab Ydate <C-R>=strftime("%Y-%m-%d")<CR>

" Transparent editing of gpg encrypted files.
" By Wouter Hanegraaff <wouter@blub.net>
"-------------------------------------------------------------------------------
augroup encrypted
    au!

    " First make sure nothing is written to ~/.viminfo while editing
    " an encrypted file.
    autocmd BufReadPre,FileReadPre      *.gpg set viminfo=
    " We don't want a swap file, as it writes unencrypted data to disk
    autocmd BufReadPre,FileReadPre      *.gpg set noswapfile
    " Switch to binary mode to read the encrypted file
    autocmd BufReadPre,FileReadPre      *.gpg set bin
    autocmd BufReadPre,FileReadPre      *.gpg let ch_save = &ch|set ch=2
    autocmd BufReadPost,FileReadPost    *.gpg '[,']!gpg --decrypt 2> /dev/null
    " Switch to normal mode for editing
    autocmd BufReadPost,FileReadPost    *.gpg set nobin
    autocmd BufReadPost,FileReadPost    *.gpg let &ch = ch_save|unlet ch_save
    autocmd BufReadPost,FileReadPost    *.gpg execute ":doautocmd BufReadPost " . expand("%:r")

    " Convert all text to encrypted text before writing
    autocmd BufWritePre,FileWritePre    *.gpg   '[,']!gpg --default-recipient-self -ae 2>/dev/null
    " Undo the encryption so we are back in the normal text, directly
    " after the file has been written.
    autocmd BufWritePost,FileWritePost    *.gpg   u
    autocmd VimLeave                      *.gpg !clear
augroup END

" some helpfull settings when coding python
"-------------------------------------------------------------------------------
augroup python
    autocmd BufReadPre,FileReadPre      *.py let python_highlight_numbers = 1
    autocmd BufReadPre,FileReadPre      *.py let python_highlight_builtins = 1
    autocmd BufReadPre,FileReadPre      *.py let python_highlight_exceptions = 1
    autocmd BufReadPre,FileReadPre      *.py set expandtab
    autocmd BufReadPre,FileReadPre      *.py set autoindent
    autocmd BufReadPre,FileReadPre      *.py set copyindent
    autocmd BufReadPre,FileReadPre      *.py set sw=4
    autocmd BufReadPre,FileReadPre      *.py set ts=4
    autocmd BufReadPre,FileReadPre      *.py set sts=4
    autocmd BufReadPre,FileReadPre      *.py set smarttab
    autocmd BufRead                     *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
augroup END

" some helpfull settings when coding python
"-------------------------------------------------------------------------------
augroup c
    autocmd BufReadPre,FileReadPre      *.c set expandtab
    autocmd BufReadPre,FileReadPre      *.c set autoindent
    autocmd BufReadPre,FileReadPre      *.c set copyindent
    autocmd BufReadPre,FileReadPre      *.c set sw=4
    autocmd BufReadPre,FileReadPre      *.c set ts=4
    autocmd BufReadPre,FileReadPre      *.c set sts=4
    autocmd BufReadPre,FileReadPre      *.c set smarttab
augroup END

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

" status line coolness
"-------------------------------------------------------------------------------
set statusline= " clear the statusline for when vimrc is reloaded
set statusline+=%f\ " file name
set statusline+=%h%m%r%w " flags
set statusline+=[%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}] " file format
set statusline+=%= "left/right separator
set statusline+=%b,0x%-8B\ " current char
set statusline+=%c,%l/ "cursor column/total lines
set statusline+=%L\ %P "total lines/percentage in file
set ls=2

" OS Specific settings
"     This allows for OS specific overrides like binary locations etc.
"-------------------------------------------------------------------------------

" set a default
let s:uname = "default"

if has("win32")
  let s:uname = "win32"
else
  if has("unix")
    let s:uname = substitute(system('uname -s'), "\n", "", "")
  endif
endif

let s:DistCFG = expand('~/.vimrc.'.s:uname)

for fpath in split(globpath('~/.vim/settings', '*.vim'), '\n')
  exe 'source' fpath
endfor

if filereadable(s:DistCFG)
  exe "source " . s:DistCFG
endif

"-------------------------------------------------------------------------------
" end of file
"-------------------------------------------------------------------------------
