set makeprg=python2\ -m\ py_compile\ %
set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
"set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
"
" key bindings
nnoremap <leader>m :make<CR>
nnoremap <leader>M :Make<CR>

set nu rnu
