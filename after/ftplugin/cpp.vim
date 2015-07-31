"iabbrev <buffer> iff if ( ) {<cr><++><cr>}<C-o>%<C-o>F)<left>

compiler clang |setlocal makeprg=~/.bin/build\ $*\ %:p:r.cpp
"setlocal foldmethod=syntax foldlevel=20

"setlocal nu grepprg=grep\ -n\ -R\ --exclude=.tags\ '--exclude=*.sw[a-z]'

iabbrev <buffer> iff if ( ) {<cr><++><cr>}<C-o>%<C-o>F)<left>
iabbrev <buffer> ife if ( ) {<cr><++><cr>} else {<cr><++><cr>}<C-o>%<C-o>F}<C-o>%<C-o>F)<left>
iabbrev ii include

call omni#cpp#complete#Init()

" vim: ft=vim nu
