"--------------------------------------------------------------------------
"
"         FILE:  .vim/plugins.vim
"
"  DESCRIPTION:  Plugins used in this tragedy
"
"      CREATED:  Fri, 11 Aug 2017
"
"--------------------------------------------------------------------------

" test if we have vundle
" --------------------------------------
let s:vundledir = expand('~/.vim/bundle/Vundle.vim')
if !isdirectory(s:vundledir)
  finish
endif

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
if (has('win32') || has('win64'))
  set rtp+=$HOME/.vim
endif
call vundle#begin()

Plugin 'VundleVim/Vundle.vim.git'

" vim: interpret a file by function and cache file automatically
Plugin 'MarcWeber/vim-addon-mw-utils.git'

" Some utility functions for VIM
Plugin 'tomtom/tlib_vim.git'

" snipMate.vim aims to be a concise vim script that implements some of
" TextMate's snippets features in Vim.
Plugin 'garbas/vim-snipmate.git'

" A tree explorer plugin for vim.
Plugin 'scrooloose/nerdtree.git'

Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'

" fugitive.vim: a Git wrapper so awesome, it should be illegal
Plugin 'tpope/vim-fugitive'

Plugin 'kien/ctrlp.vim'

call vundle#end()
filetype plugin indent on    " required
