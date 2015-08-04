set nu tabstop=4 shiftwidth=4 expandtab
compiler javac
"set errorformat=%A:%f:%l:\ %m,%-Z%p^,%-C%.%#
set makeprg=make

set grepprg=ack\ -k\ --java

"style-check:
set errorformat+=%f:%l:%c:\ %m
command! Jbp execute ("!echo stop in %:" . line(".").">> .jdbrc")
