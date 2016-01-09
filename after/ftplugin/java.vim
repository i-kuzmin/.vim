set nu tabstop=2 shiftwidth=2 expandtab
compiler javac
"set errorformat=%A:%f:%l:\ %m,%-Z%p^,%-C%.%#
set makeprg=make

set grepprg=ack\ -k\ --java

"style-check:
set errorformat+=%f:%l:%c:\ %m

set tags+=~/src/java/jdk_src/jdk8.tags
command! Jbp execute ("!echo stop in %:" . line(".").">> .jdbrc")
