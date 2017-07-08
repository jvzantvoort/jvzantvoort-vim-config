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

" General settings
"-------------------------------------------------------------------------------
colors murphy

filetype plugin on

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

syn on
" OS Specific settings
"     This allows for OS specific overrides like binary locations etc.
"-------------------------------------------------------------------------------

" set a default
let s:uname = "default"
let s:hostname = "default"

if has("win32")
  let s:uname = "win32"
else
  if has("unix")
    let s:uname = substitute(system('uname -s'), "\n", "", "")
    let s:hostname = substitute(system('uname -n'), "\n", "", "")
  endif
endif

let s:DistCFG = expand('~/.vim/os/'.s:uname.'.vim')
let s:HostCFG = expand('~/.vim/hosts/'.s:hostname.'.vim')

for fpath in split(globpath('~/.vim/settings', '*.vim'), '\n')
  exe 'source' fpath
endfor

if filereadable(s:DistCFG)
  exe "source " . s:DistCFG
endif

if filereadable(s:HostCFG)
  exe "source " . s:HostCFG
endif

"-------------------------------------------------------------------------------
" end of file
"-------------------------------------------------------------------------------
