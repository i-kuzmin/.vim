setlocal nu tabstop=2 shiftwidth=2 softtabstop=0 expandtab smarttab
"set errorformat=%A:%f:%l:\ %m,%-Z%p^,%-C%.%#
"setlocal makeprg=make

setlocal grepprg=ack\ -k\ --java
setlocal nu

"style-check:
"set errorformat+=%f:%l:%c:\ %m
set tags+=~/src/java/jdk_src/jdk8.tags
command! Jbp execute ("!echo stop in %:" . line(".").">> .jdbrc")

setlocal include=^#\s*import
setlocal includeexpr=substitute(v:fname,'\\.','/','g')
setlocal suffixesadd=.java,.class
