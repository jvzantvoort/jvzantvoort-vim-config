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
let s:plugsindir = expand('~/.vim/plugins/')
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

if !exists('g:enable_airline')
  let g:enable_airline=0
endif

function! LoadConfigFile(configfile)
  exe "source " . s:plugsindir .  a:configfile
endfunction

if version >= 800

  " Add language-server-protocol
  Plugin 'prabirshrestha/asyncomplete.vim'
  Plugin 'prabirshrestha/async.vim'
  Plugin 'prabirshrestha/vim-lsp'
  Plugin 'prabirshrestha/asyncomplete-lsp.vim'

endif

Plugin 'VundleVim/Vundle.vim.git'

" vim: interpret a file by function and cache file automatically
Plugin 'MarcWeber/vim-addon-mw-utils.git'

" Some utility functions for VIM
Plugin 'tomtom/tlib_vim.git'

Plugin 'seeamkhan/robotframework-vim'

" snipMate.vim aims to be a concise vim script that implements some of
" TextMate's snippets features in Vim.
"Plugin 'garbas/vim-snipmate.git'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'

" A tree explorer plugin for vim.
Plugin 'scrooloose/nerdtree.git'

Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'

" Plugin 'kien/ctrlp.vim'
Plugin 'Glench/Vim-Jinja2-Syntax'

Plugin 'nvie/vim-flake8'

Plugin 'chase/vim-ansible-yaml'

Plugin 'cespare/vim-toml'

Plugin 'fatih/vim-go'

Plugin 'hashivim/vim-terraform'

" Syntax highlighting and icons for nerdtree
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'

Plugin 'jhradilek/vim-docbk'

Plugin 'martinda/Jenkinsfile-vim-syntax'
Plugin 'vimwiki/vimwiki'

" ------------------------------------------------------------------------------
" Some platform/environment specific plugins
" ------------------------------------------------------------------------------
" set a default
let s:uname = "default"

if has("win32") || has("win64")
  let s:uname = "windows"
else
  if has("unix")
    let s:uname = substitute(system('uname -s'), "\n", "", "")
  endif
endif

" On gui without Linux its worth messing around with airline
" otherwise it just messes up the display.
if g:enable_airline == "1"

    set laststatus=2
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    if !exists("g:airline_symbols")
      let g:airline_symbols = {}
    endif
    let g:airline_theme="luna"
    let g:airline_powerline_fonts=1
    let g:syntastic_error_symbol = '?'
    " let g:airline_symbols.space = "\ua0"
    let g:airline#extensions#branch#empty_message  =  "no .git"
    let g:airline#extensions#whitespace#enabled    =  0
    let g:airline#extensions#syntastic#enabled     =  1
    let g:airline#extensions#tabline#enabled       =  1
    let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
    let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
    let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter
    " let g:syntastic_error_symbol = '✘'
    " let g:syntastic_warning_symbol = "▲"
    let g:airline_powerline_fonts = 1
endif

call vundle#end()
filetype plugin indent on    " required

let g:terraform_fmt_on_save=1
