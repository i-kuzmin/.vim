"iabbrev <buffer> iff if ( ) {<cr><++><cr>}<C-o>%<C-o>F)<left>

"compiler clang |setlocal makeprg=~/.bin/build\ $*\ %:p:r.cpp
"setlocal foldmethod=syntax foldlevel=20

"setlocal nu grepprg=grep\ -n\ -R\ --exclude=.tags\ '--exclude=*.sw[a-z]'
"
set grepprg=ack\ -k\ --cpp


iabbrev <buffer> iff if ( ) {<cr><++><cr>}<C-o>%<C-o>F)<left>
iabbrev <buffer> ife if ( ) {<cr><++><cr>} else {<cr><++><cr>}<C-o>%<C-o>F}<C-o>%<C-o>F)<left>
iabbrev ii include

set tags +=,~/.tags/cpp.tags

" :CTAGS

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

call omni#cpp#complete#Init()

" vim: ft=vim nu
