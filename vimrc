set nocompatible
execute pathogen#infect()
" execute .vimrc in working directory
set exrc hlsearch nohidden
set textwidth=120 tabstop=4 shiftwidth=4 expandtab nowrap

set fileencodings=ucs-bom,utf-8,default,cp1251,cp866,latin1

" use blowfish2 for encrypt files
set cryptmethod=blowfish2

if has('gui_running')
    set guioptions=ai
    set background=light
    set guifont=DejaVu\ Sans\ Mono\ 8
else
    set background=dark
    "let g:solarized_termtrans = 1
endif

" Plugin configuration

" latex-suit
let g:tex_flavor = "latex"

" google translate
let g:goog_user_conf = { 'langpair': 'en|ru', 'cmd': 'node', 'v_key': 'T' }

" solorized color scheme
let g:solarized_hitrail=1
"let g:solarized_visibility="low"

" ctags
let g:ctags_statusline=1
let g:ctags_title=0
autocmd FileType cpp :CTAGS


syntax enable
colorscheme solarized

" Russian keymaps
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

"spell
set spell spelllang=ru_yo,en_us

set tags+=.tags
filetype plugin on
filetype indent on

nohlsearch
set incsearch
set clipboard=unnamed
set cursorline

set listchars=tab:▸\ ,eol:¬

"
" insert mode mappings (imap)
"

inoremap jj <esc>
inoremap jk <esc>


" this will help forgot escape
" inoremap <esc> <nop>

"
" normal mode mappings
"
nnoremap <silent> p :cprevious<CR>
nnoremap <silent> n :cnext<CR>
nnoremap <silent> w :botright cwindow<CR>


nnoremap <silent> <leader>p :lprevious<CR>
nnoremap <silent> <leader>n :lnext<CR>
nnoremap <silent> <leader>w :botright lwindow<CR>

" add empty line above/belove current
nnoremap <leader>O :set paste<CR>O<esc>:set nopaste<CR>
nnoremap <leader>o :set paste<CR>o<esc>:set nopaste<CR>

"
" Plugins
"

"   tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_autofocus=1

nnoremap <silent> <F7> :set list!<CR>

"
" visual mode mappings
"

" surround selection with ",',),{
vnoremap <leader>" v`>a"<esc>`<i"<esc>`>ll
vnoremap <leader>' v`>a'<esc>`<i'<esc>`>ll
vnoremap <leader>( v`>a)<esc>`<i(<esc>`>ll
vnoremap <leader>) v`>a)<esc>`<i(<esc>`>ll
vnoremap <leader>{ v`>a}<esc>`<i{<esc>`>ll
vnoremap <leader>} v`>a}<esc>`<i{<esc>`>ll

" highlight word under cursor
nnoremap gh :exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))<cr>

" Windows managment

nnoremap <silent> <A-Up> :wincmd k<CR>
nnoremap <silent> <A-Down> :wincmd j<CR>
nnoremap <silent> <A-Left> :wincmd h<CR>
nnoremap <silent> <A-Right> :wincmd l<CR>

nnoremap <silent> <A-k> :wincmd k<CR>
nnoremap <silent> <A-j> :wincmd j<CR>
nnoremap <silent> <A-h> :wincmd h<CR>
nnoremap <silent> <A-l> :wincmd l<CR>

nnoremap <silent> <A-K> :wincmd K<CR>
nnoremap <silent> <A-J> :wincmd J<CR>
nnoremap <silent> <A-H> :wincmd H<CR>
nnoremap <silent> <A-L> :wincmd L<CR>

nnoremap <silent> c :wincmd c<CR>
nnoremap <silent> v :wincmd v<CR>
nnoremap <silent> s :wincmd s<CR>
nnoremap <silent> o :wincmd o<CR>

nnoremap <silent> k :wincmd k<CR>
nnoremap <silent> j :wincmd j<CR>
nnoremap <silent> h :wincmd h<CR>
nnoremap <silent> l :wincmd l<CR>

nnoremap <silent> K :wincmd K<CR>
nnoremap <silent> J :wincmd J<CR>
nnoremap <silent> H :wincmd H<CR>
nnoremap <silent> L :wincmd L<CR>

"
" Tabs management
"
nmap <silent> <A-S-]> gt
nmap <silent> <A-S-[> gT
nmap <silent> <A-1> 1gt
nmap <silent> <A-2> 2gt
nmap <silent> <A-3> 3gt
nmap <silent> <A-4> 4gt
nmap <silent> <A-5> 5gt
nmap <silent> <A-6> 6gt
nmap <silent> <A-7> 7gt
nmap <silent> <A-8> 8gt
nmap <silent> <A-9> 9gt
nmap <silent> <A-0> :tablast<CR>

nmap <silent> 1 1gt
nmap <silent> 2 2gt
nmap <silent> 3 3gt
nmap <silent> 4 4gt
nmap <silent> 5 5gt
nmap <silent> 6 6gt
nmap <silent> 7 7gt
nmap <silent> 8 8gt
nmap <silent> 9 9gt
nmap <silent> 0 :tablast<CR>

"nmap gh :find %:p:t:r.h<CR>
"nmap gc :find %:p:t:r.cpp<CR>
nmap ,s :find %:t:r.cpp<CR>
nmap ,S :sf %:t:r.cpp<CR>
nmap ,h :find %:t:r.h<CR>
nmap ,H :sf %:t:r.h<CR>


nmap <leader>ew :e %%
nmap <leader>es :sp %%
nmap <leader>ev :vsp %%
nmap <leader>et :tabe %%
nmap <leader>erc :sp $MYVIMRC<CR>
nmap <leader>rrc :source $MYVIMRC<CR>

cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>


" ExploreWiki::init
let g:netrw_banner=0
"let g:old_netre_hide=0
"let g:old_netrw_list_hide=''
function! ExploreWiki()
"    if exists('g:netrw_banner')
"        let l:netrw_banner=g:netrw_banner
"    endif
    if exists('g:netrw_hide')
        let l:netrw_hide=g:netrw_hide
    endif
    if exists("g:netrw_list_hide")
        let l:netrw_list_hide=g:netrw_list_hide
    endif

    let g:netrw_banner=0
    let g:netrw_hide=1
    let g:netrw_list_hide='^\.[^.].*,Makefile'

    tabnew |lcd ~/.wiki |e .

    if exists("l:netrw_hide")
        let g:netrw_hide=l:netrw_hide
    else
        unlet g:netrw_hide
    endif

    if exists("l:netrw_list_hide")
        let g:netrw_list_hide=l:netrw_list_hide
    else
        unlet g:netrw_list_hide
    endif

"    if exists("l:netrw_banner")
"        let g:netrw_banner=l:netrw_banner
"    else
"        unlet g:netrw_banner
"    endif
endf

nnoremap <leader>ww :call ExploreWiki()<CR>

call togglebg#map("<F5>")
map <F2> :set spell!<CR>

"command! Highlihgt exe printf('match IncSearch /\<%s\>/', expand('<cword>'))

" Abbreviations


augroup filetype_tools
    autocmd!
    "autocmd FileType cpp :iabbrev <buffer> iff if ( ) {<cr><++><cr>}<C-o>%<C-o>F)<left>
    "autocmd FileType cpp :compiler clang |setlocal makeprg=~/.bin/build\ $*\ %:p:r.cpp
    autocmd FileType sh :setlocal nu grepprg=grep\ -n\ -R\ --exclude=.tags\ '--exclude=*.sw[a-z]'
    "autocmd FileType cpp :iabbrev '' ''<left>
    "autocmd FileType cpp :iabbrev "" ""<left>
    "autocmd FileType cpp :iabbrev /**/ /**/<left><left>
    "autocmd FileType cpp :setlocal foldmethod=syntax foldlevel=20
    "autocmd FileType cpp :call omni#cpp#complete#Init()
augroup END

"
" File type addons
"

"
" txt2tags
"

augroup filetype
    au! BufRead,BufNewFile *.t2t set filetype=txt2tags
    au! BufRead,BufNewFile *.ll set filetype=llvm
    au! BufRead,BufNewFile *.td set filetype=tablegen
    au! BufRead,BufNewFile *Makefile* set filetype=make
augroup END
