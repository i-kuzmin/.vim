set nu
set cindent
set smartindent
set autoindent
set makeprg=perl\ -c\ %\ $*
"set errorformat=%f:%l:%m
set autowrite
map <F7> :!perl -c %<CR>
map <F5> :!perl  %<CR>

