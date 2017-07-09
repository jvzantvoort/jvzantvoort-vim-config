
function! TakeNote()
    let is_git = substitute(system('git rev-parse --is-inside-work-tree'), "\n", "", "")
    if is_git == "true"
       let topdir = substitute(system('git rev-parse --show-toplevel'), "\n", "", "")
    else
       let topdir = system("pwd")
    endif
    echo topdir
    let notesfile = topdir . ".notes.txt"
    set splitright
    vsplit + notesfile

endfunction
