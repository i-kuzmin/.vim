set nocompatible
filetype off

" Pathogen --- {{{
  runtime bundle/vim-pathogen/autoload/pathogen.vim
  execute pathogen#infect()
" }}} --- pathogen

" Vundle --- {{{
  call vundle#begin('~/.vim/vundle')
  Plugin 'Shougo/deoplete.nvim'
  if !has('nvim')
    Plugin 'roxma/nvim-yarp'
    Plugin 'roxma/vim-hug-neovim-rpc'
  endif
  Plugin 'Shougo/neosnippet.vim'
  Plugin 'Shougo/neosnippet-snippets'
  "Plugin 'Valloric/YouCompleteMe'
  Plugin 'lervag/vimtex'

  " Let clangd fully control code completion
  ""let g:ycm_clangd_uses_ycmd_caching = 0
  ""let g:loaded_youcompleteme = 1 
  """ Use installed clangd, not YCM-bundled clangd which doesn't get updates.
  ""let g:ycm_clangd_binary_path = exepath("clangd")

  "Plugin 'vim-syntastic/syntastic'
  "Plugin 'scrooloose/nerdtree'
  "Plugin 'altercation/vim-colors-solarized'
  "Plugin 'ctrlpvim/ctrlp.vim'
  "Plugin 'rust-lang/rust.vim'
  "Plugin 'majutsushi/tagbar'
  "Plugin 'tpope/vim-fugitive'
  "Plugin 'tpope/vim-dispatch'
  "Plugin 'tpope/vim-surround'
  "Plugin 'tpope/vim-abolish'
  "Plugin 'tpope/vim-commentary'
  "Plugin 'tpope/vim-rsi'
  "Plugin 'tpope/vim-unimpaired'
  "Plugin 'nelstrom/vim-visual-star-search'
  "Plugin 'mileszs/ack.vim'
  "Plugin 'vim-scripts/OmniCppComplete'
  call vundle#end()
" }}} --- vundle

" execute .vimrc in working directory
set exrc hlsearch nohidden
set textwidth=120 tabstop=4 shiftwidth=4 expandtab nowrap
set splitright splitbelow

set pastetoggle=<f4>
set undofile

set fileencodings=ucs-bom,utf-8,default,cp1251,cp866,latin1
set ttyfast

" use blowfish2 for encrypt files
if (version >= 744) && ! has('nvim')
    set cryptmethod=blowfish2
endif

if has('gui_running')
    set guioptions=ai
    set background=light
    set guifont=DejaVu\ Sans\ Mono\ 8\ for\ Powerline
else
    set background=dark
    "let g:solarized_termtrans = 1
    "let g:solarized_termcolors=256
    "let g:solarized_degrade = 1
endif

" Plugin configuration

" latex-suit
let g:tex_flavor = "latex"

" --- netrw --- {{{
  " disable plugin
  "let loaded_netrwPlugin = 1

" }}} ---

" --- Solarized color scheme --- {{{
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
  "   }}} --- enable italic for screen terminal
" }}} --- solorized color scheme

" --- ctags --- {{{
  let g:ctags_statusline=1
  let g:ctags_title=0
" }}} --- ctags

" --- airline --- {{{
  let g:airline_theme = "solarized"
    "let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts=1

  " --- symbols --- {{{
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''

    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif
    let g:airline_symbols.notexists = '∄'
    let g:airline_symbols.paste = 'ρ'
    "let g:airline_symbols.space = "\ua0"
  " --- }}} --- symbols

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

  let g:airline#extensions#branch#enabled = 0
  "let g:airline#extensions#default#section_truncate_width = { 'a' : 10 }
  " or only load what you want
  "let g:airline_extensions = ['branch', 'tabline']

  let g:airline#extensions#default#layout =
        \ [
        \   [ 'a', 'b', 'c' ],
        \   [ 'x', 'z', 'warning', 'error' ]
        \ ]

  let g:airline#extensions#tabline#show_splits = 1
  let g:airline#extensions#tabline#enabled = 0
  let g:airline#extensions#tabline#tabs_label = 't'
  let g:airline#extensions#tabline#show_close_button = 0

  " display full hirarchy of a tag
  let g:airline#extensions#tagbar#flags = 'f'

" }}} --- airline

" --- ctrlp --- {{{
  let g:ctrlp_switch_buffer = 'Et'
  let g:ctrlp_working_path_mode = 'wr'
  let g:ctrlp_root_markers = ['Makefile']
  let g:ctrlp_max_depth = 100
  let g:ctrlp_max_files = 100000
  let g:ctrlp_open_multiple_files = '2vjr'
" }}} --- ctrlp

" --- syntastic --- {{{
if exists('g:loaded_syntastic_plugin')
  noremap <leader>st :SyntasticToggleMode<CR>
  noremap <leader>sr :SyntasticReset<CR>
  noremap <leader>sc :SyntasticCheck<CR>

  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_enable_signs = 1

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 0
  let g:syntastic_check_on_wq = 0
  let g:syntastic_cpp_clang_check_post_args = "" "use compilation database
  let g:syntastic_cpp_checkers = ["clang_check"]
  let g:syntastic_enable_highlighting = 1
  let g:syntastic_mode_map = { "mode" : "passive" }
endif
" }}} --- syntastic

" --- tagbar {{{

  nnoremap <silent> <F8> :TagbarToggle<CR>
  let g:tagbar_autofocus=1

"  }}} --- tagbar

" --- ycm {{{
 let g:ycm_auto_hover=""
 nnoremap <silent> <leader>jd :YcmCompleter GoToImprecise<CR>
 nnoremap <silent> <leader>ji :YcmCompleter GoToInclude<CR>
 nnoremap <silent> <leader>jr :YcmCompleter GoToReferences<CR>
 nnoremap <silent> <leader>js :YcmCompleter GoToSymbol 
 nnoremap <silent> <leader>yt :YcmCompleter GetTypeImprecise<CR> 
 nnoremap <silent> <leader>yd :YcmCompleter GetDocImprecise<CR> 
" GoTo
" GoToDeclaration
" GoToDefinition
" GoToImprecise
" GoToInclude
" GoToReferences
" GoToSymbol
let g:enable_ycm_at_startup = 0
let g:ycm_show_diagnostics_ui = 0

"  }}} --- ycm

" --- UltiSnips --- {{{
  " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
  " let g:UltiSnipsExpandTrigger="<tab>"
  " let g:UltiSnipsJumpForwardTrigger="<c-b>"
  " let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  let g:UltiSnipsListSnippets="<c-v>"
  " If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit="vertical"

" }}} --- ultisnips

syntax enable
colorscheme solarized
" --- Adjust color scheme --- {{{
  hi! Folded ctermbg=NONE cterm=bold
" }}} --- adjust color scheme

" from sensible vim
set backspace=indent,eol,start

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set laststatus=2
set ruler
set showcmd
"set complete-=i
set wildmenu
set wildmode=list:longest "list all match, complete till longest common string.

"Leader mappings doesn't work if next line uncomment:
"set tm=0

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
set spell spelllang=en_us,pt_pt,ru_yo

set tags+=.tags
filetype plugin on
filetype indent on

nohlsearch
set incsearch
set clipboard=unnamedplus
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

" Mappings --- {{{
"
nnoremap <space> a <esc>

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

vnoremap <leader>/ <esc>/\%>'<\%<'>

" make
nnoremap <leader>m :up<CR>:make<CR>
nnoremap <leader>M :up<CR>:Make<CR>

" clipboard
nnoremap <leader>gp a <C-R>"<ESC>
nnoremap <leader>gP i <C-R>"<ESC>

nnoremap <silent> <F7> :set list!<CR>

" highlight word under cursor
nnoremap gh :exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))<cr>
nnoremap gH :match<cr>

nmap <leader>ew :e %%
nmap <leader>es :sp %%
nmap <leader>ev :vsp %%
nmap <leader>et :tabe %%
nmap <leader>erc :vs $MYVIMRC<CR>
nmap <leader>src :source $MYVIMRC<CR>

" Stop entering Ex mode accidentally
nnoremap Q <esc>

"inoremap jk <esc>
inoremap  <C-^>
cnoremap  <C-^>
nnoremap  a<C-^><esc>

"inoremap <C-c> <esc>


" this will help forgot escape
" inoremap <esc> <nop>

" }}} --- Mappings

" Windows managment --- {{{

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

" }}} --- windows managment

" Tabs management {{{

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

" }}} --- tabs management

cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>

" ExploreWiki::init --- {{{
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

" }}} --- explore wiki


call togglebg#map("<F5>")
map <F2> :set spell!<CR>


" File types --- {{{
augroup filetype
    au! BufRead,BufNewFile *.t2t set filetype=txt2tags
    au! BufRead,BufNewFile *.ll set filetype=llvm
    au! BufRead,BufNewFile *.td set filetype=tablegen
    au! BufRead,BufNewFile *Makefile* set filetype=make
augroup END
" }}} ----- file types

" vim: fdm=marker ts=2 sw=2
