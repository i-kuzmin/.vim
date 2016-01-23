"compiler clang |setlocal makeprg=~/.bin/build\ $*\ %:p:r.cpp
"compiler clang|setlocal makeprg=vim_cpp_build\ $*\ %:p:r.cpp
compiler clang|setlocal makeprg=~/.bash/vim-tools\ cpp_build\ $*\ %:p:r.cpp
"setlocal foldmethod=syntax foldlevel=20
setlocal nu grepprg=grep\ -n\ -R\ --exclude=.tags\ '--exclude=*.sw[a-z]'
set colorcolumn=86
"set grepprg=ack\ -k\ --cpp

" Ack plugin
let g:ack_default_options .= " --cpp"

" Clang tools
map <leader>f :pyf ~/src/clang-llvm/llvm/tools/clang/tools/clang-format/clang-format.py<cr>
imap <leader>f <c-o>:pyf ~/src/clang-llvm/llvm/tools/clang/tools/clang-format/clang-format.py<cr>

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

" Auto-commands
augroup vim_cpp
    autocmd! 
"    autocmd! BufWrite <buffer> :silent Make
augroup END

call omni#cpp#complete#Init()

" key bindings
"nnoremap <leader>m :wa<CR>:make all<CR>
"nnoremap <leader>M :wa<CR>:Make all<CR>

"" play with folding
"setlocal foldmethod=expr
"setlocal foldexpr=GetTBFold(v:lnum)
"
"function! GetTBFold(lnum)
"    return '0'
"endfunction

" vim: ft=vim nu
