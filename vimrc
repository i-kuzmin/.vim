set nocompatible
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
"
" execute .vimrc in working directory
set exrc hlsearch nohidden
set textwidth=120 tabstop=4 shiftwidth=4 expandtab nowrap
set splitright splitbelow

set pastetoggle=<f4>

set fileencodings=ucs-bom,utf-8,default,cp1251,cp866,latin1

set ttyfast

" use blowfish2 for encrypt files
if version >= 744
    set cryptmethod=blowfish2
endif

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

" Solarized color scheme --- {{{
let g:solarized_hitrail=1
"let g:solarized_visibility="low"
" Enable italic for screen terminal --- {{{
if $TERM_PROGRAM == ""
    let s:solarized_terms_italic=[
         \"screen.urxvt-256color",
         \"rxvt-unicode-256color"
          \]
    for term in s:solarized_terms_italic
        if $TERM =~ term
            let $TERM_PROGRAM = "rxvt"
        endif
    endfor
endif
"     }}} --- enable italic for screen terminal
" }}} --- solorized color scheme

" ctags
let g:ctags_statusline=1
let g:ctags_title=0

" airline
let g:airline_powerline_fonts = 1
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"


let g:airline_theme = "solarized"

syntax enable
colorscheme solarized
" Adjust color scheme --- {{{
hi! Folded ctermbg=NONE cterm=bold
" }}} --- adjust color scheme


" from sensible vim
set backspace=indent,eol,start
set complete-=i

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set laststatus=2
set ruler
set showcmd
set wildmenu

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if v:version > 703 || v:version == 703 && has("patch541")
    set formatoptions+=j " Delete comment character when joining commented lines
endif

" Russian keymaps
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

"spell
set spell spelllang=en_us,ru_yo

set tags+=.tags
filetype plugin on
filetype indent on

nohlsearch
set incsearch
set clipboard=unnamed
set cursorline

set listchars=tab:▸\ ,eol:¬

" Line numbers --- {{{
function! SetNumber(mode)
    if &number ==# "nonumber"
        return
    endif
    if a:mode ==# "relative"
        setlocal relativenumber
    elseif a:mode ==# "absolute"
        setlocal norelativenumber
    endif
endfunction
augroup line_numbers
    autocmd!
    autocmd! FocusLost *   :call SetNumber("absolute")
    autocmd! InsertEnter * :call SetNumber("absolute")
    autocmd! WinLeave *    :call SetNumber("absolute")

    autocmd! FocusGained * :call SetNumber("relative")
    autocmd! InsertLeave * :call SetNumber("relative")
    autocmd! WinEnter *    :call SetNumber("relative")
augroup END
" }}} --- line numbers

" Active window width --- {{{
function! SetupMinWindowSize()
    if &colorcolumn > 0
        let l:width = &colorcolumn - 1
    elseif &textwidth > 0
        let l:width = &textwidth
    else
        let l:width = 80
    endif
    let l:required = l:width
    if &number ==# "number" || &relativenumber ==# "relativenumber"
        let l:required += &numberwidth
    endif
    let &winwidth = l:required
    let &winheight = 10
endfunction
"augroup window_size
"    autocmd!
"    autocmd! FileType *  :call SetupMinWindowSize()
"augroup END
" }}} --  active window width

"
" interpreter config
"
let $BASH_ENV = "~/.bash/vim-tools"

"
" insert mode mappings (imap)
"

"inoremap jj <esc>
inoremap  <C-^>
cnoremap  <C-^>
inoremap <C-c> <esc>


" this will help forgot escape
" inoremap <esc> <nop>

"
" Normal Mode Mappings --- {{{
"
nnoremap <silent> p :cprevious<CR>
nnoremap <silent> n :cnext<CR>
nnoremap <silent> w :botright cwindow<CR>
nnoremap <silent> e :Explore<CR>


nnoremap <silent> <leader>p :lprevious<CR>
nnoremap <silent> <leader>n :lnext<CR>
nnoremap <silent> <leader>w :botright lwindow<CR>

" add empty line above/belove current
nnoremap <leader>O  :call helpers#InsertEmptyLine(1)<CR>
nnoremap <leader>o  :call helpers#InsertEmptyLine(2)<CR>
nnoremap <leader>go :call helpers#InsertEmptyLine(3)<CR>
"nnoremap <leader><C-o> :call helpers#InsertEmptyLine(3)<CR>

vnoremap <silent> <leader>y y:silent '<,'>w !xsel -ib<CR>
nnoremap <silent> <leader>p :silent r !xsel -ob<CR>
nnoremap <silent> <leader>P O<esc>:silent r !xsel -ob<CR>
" }}} --- Normal Mode Mappings


"
" Plugins
"

"   tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_autofocus=1

nnoremap <silent> <F7> :set list!<CR>

" airline plugin
let g:airline_powerline_fonts=0

let g:airline_left_sep=''
let g:airline_right_sep=''

let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }

" control which sections get truncated and at what width. >
"
let g:airline#extensions#branch#enabled = 0
"let g:airline#extensions#default#section_truncate_width = { 'a' : 10 }
" or only load what you want
"   let g:airline_extensions = ['branch', 'tabline']

let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ [ 'x', 'z', 'warning' ]
      \ ]

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
nnoremap gH :match<cr>

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

nnoremap <silent> <A-c> :wincmd c<CR>
nnoremap <silent> <A-v> :wincmd v<CR>
nnoremap <silent> <A-s> :wincmd s<CR>
nnoremap <silent> <A-o> :wincmd o<CR>

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

nmap ,s :find  %:t:r.cpp<CR>
nmap ,S :sfind %:t:r.cpp<CR>
nmap ,i :find  %:t:r.inl<CR>
nmap ,I :sfind %:t:r.inl<CR>
nmap ,h :find  %:t:r.h<CR>
nmap ,H :sfind %:t:r.h<CR>


nmap <leader>ew :e %%
nmap <leader>es :sp %%
nmap <leader>ev :vsp %%
nmap <leader>et :tabe %%
nmap <leader>erc :sp $MYVIMRC<CR>
nmap <leader>src :source $MYVIMRC<CR>

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

" key bindings
nnoremap <leader>m :up<CR>:make<CR>
nnoremap <leader>M :up<CR>:Make<CR>

nnoremap <leader>gp a <C-R>"<ESC>
nnoremap <leader>gP i <C-R>"<ESC>

call togglebg#map("<F5>")
map <F2> :set spell!<CR>

"command! Highlihgt exe printf('match IncSearch /\<%s\>/', expand('<cword>'))

" Abbreviations


augroup filetype_tools
    autocmd!
    "autocmd FileType cpp :iabbrev <buffer> iff if ( ) {<cr><++><cr>}<C-o>%<C-o>F)<left>
    "autocmd FileType cpp :compiler clang |setlocal makeprg=~/.bin/build\ $*\ %:p:r.cpp
    "autocmd FileType sh :setlocal nu grepprg=grep\ -n\ -R\ --exclude=.tags\ '--exclude=*.sw[a-z]'
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
    au!
    au! BufRead,BufNewFile *.t2t set filetype=txt2tags
    au! BufRead,BufNewFile *.ll set filetype=llvm
    au! BufRead,BufNewFile *.td set filetype=tablegen
    au! BufRead,BufNewFile *Makefile* set filetype=make
augroup END

" vim: fdm=marker
