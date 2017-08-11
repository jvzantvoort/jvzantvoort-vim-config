"===============================================================================
"
"         FILE:  colors.vim
"
"        USAGE:  colors.vim
"
"  DESCRIPTION:  Set colors
"
"      OPTIONS:  ---
" REQUIREMENTS:  ---
"         BUGS:  ---
"        NOTES:  ---
"       AUTHOR:  John van Zantvoort (jvzantvoort), John@vanZantvoort.org
"      COMPANY:  none
"      CREATED:  11-Aug-2017
"===============================================================================

"Default
colorscheme blackboard

function CheckRo()
    if &readonly
        colorscheme pablo
    else
        colorscheme blackboard
    endif
endfunction
au BufReadPost * call CheckRo()

if &diff
  colorscheme molokai
endif
