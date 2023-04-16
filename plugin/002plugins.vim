let s:plugsindir = expand('~/.vim/plugins/')

if (has('win32') || has('win64'))
  set rtp+=$HOME/.vim
endif

call plug#begin('~/.vim/bundle')

" Colors
" --------------------------------------
" A tree explorer plugin for vim.
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'

" Languages
" --------------------------------------
Plug 'seeamkhan/robotframework-vim'

Plug 'pearofducks/ansible-vim'
Plug 'Glench/Vim-Jinja2-Syntax', { 'branch': 'master' }

Plug 'cespare/vim-toml', { 'branch': 'main' }

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

Plug 'hashivim/vim-terraform'

Plug 'nvie/vim-flake8'

Plug 'jhradilek/vim-docbk'

Plug 'martinda/Jenkinsfile-vim-syntax'

" Snippets
" --------------------------------------
" snipMate.vim aims to be a concise vim script that implements some of
" TextMate's snippets features in Vim.
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" Navigation
" --------------------------------------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

filetype plugin indent on    " required

set nocompatible
filetype off
