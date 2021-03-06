"compiler clang |setlocal makeprg=~/.bin/build\ $*\ %:p:r.cpp
"compiler clang|setlocal makeprg=vim_cpp_build\ $*\ %:p:r.cpp
compiler clang "|setlocal makeprg=vim_cpp_build\ all
"compiler clang|setlocal makeprg=~/.bash/vim-tools\ cpp_build\ $*\ %:p:r.cpp
"compiler clang|setlocal makeprg=tbmake\ RECURSIVE=NO
"setlocal foldmethod=syntax foldlevel=20
setlocal nu rnu
"grepprg=grep\ -n\ -R\ --exclude=.tags\ '--exclude=*.sw[a-z]'
set colorcolumn=86
"set grepprg=ack\ -k\ --cpp

" Ack plugin
let g:ack_default_options = "-s -H --nocolor --nogroup --column --cpp"

" Clang tools
map <leader>f :pyf ~/src/clang-llvm/llvm/tools/clang/tools/clang-format/clang-format.py<cr>
imap <leader>f <c-o>:pyf ~/src/clang-llvm/llvm/tools/clang/tools/clang-format/clang-format.py<cr>

"iabbrev <buffer> iff if ( ) {<cr><++><cr>}<C-o>%<C-o>F)<left>
"iabbrev <buffer> ife if ( ) {<cr><++><cr>} else {<cr><++><cr>}<C-o>%<C-o>F}<C-o>%<C-o>F)<left>
iabbrev ii include

set tags+=$HOME/.tags/cpp

" --- Switch between headers --- {{{
nmap ,s :find  %:t:r.cpp<CR>
nmap ,S :sfind %:t:r.cpp<CR>
nmap ,i :find  %:t:r.inl<CR>
nmap ,I :sfind %:t:r.inl<CR>
nmap ,h :find  %:t:r.h<CR>
nmap ,H :sfind %:t:r.h<CR>
" }}} --- switch between headers
" --- OmniCppComplete --- {{{
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
call omni#cpp#complete#Init()
" }}} --- omnicppcomplete

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview

" Auto-commands
augroup vim_cpp
    autocmd! 
"    autocmd! BufWrite <buffer> :silent Make
augroup END

call SetupMinWindowSize()

set imsearch=0 iminsert=0

" vim: fdm=marker ft=vim nu
