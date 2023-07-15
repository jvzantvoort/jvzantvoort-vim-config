"  Some settings learned from Damian Conway's presentation.

exec 'set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~'
set list

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
