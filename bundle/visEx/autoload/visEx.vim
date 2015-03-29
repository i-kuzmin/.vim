" visEx.vim:
" Function:	executes visually selected block as a bash script.
" Version:	0.1
" Date:		Mar 28, 2015
"
" Author:   Ilya Kuzmin <i.g.kuzmin.spb@gmail.com>
"
" ------------------------------------------------------------------------------
" Initialization: {1
" Exit quickly when plugin has already been loaded or
" when 'compatible' is set
if &cp || exists("g:loaded_visEx")
  finish
endif

let g:loaded_visEx = "v01"
let g:execFileName='/tmp/visEx.exec'

" ------------------------------------------------------------------------------
" Funcitons: {1
" ------------------------------------------------------------------------------
" visEx#Exec: {2
function! visEx#Exec(...)
    let l:qargs = []
	for item in a:000
        call add(l:qargs, "'".item."'")
	endfor

    call visEx#ExecuteOperator(visualmode(), join( l:qargs, ' '))
    execute "vnoremap <leader>e :<c-u>call visEx#Exec(".join(l:qargs, ', ').")"
endfunction

" visEx#ExecuteOperator: {2
function! visEx#ExecuteOperator( type, args)
    if exists("g:loaded_vis")
        let l:prefix='B '
    else
        let l:prefix=''
    endif

    execute "'<,'>".l:prefix."w! ".g:execFileName
    echom "'<,'>".l:prefix."w! ".g:execFileName
    execute "!bash -f ".g:execFileName." ".a:args." |tee /dev/stderr |xsel -ib"
    "if a:type ==? 'v'
    "elseif a:type ==# 'char'
    "    execute "normal! '[']echom"
    "else
    "    return
    "endif
endfunction
" Modelines: {1
" vim: fdm=marker foldmarker={,}
