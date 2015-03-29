" visEx.vim:
" Function:	executes visually selected block as a bash script.
" Version:	0.1
" Date:		Mar 28, 2015
"
" Author:   Ilya Kuzmin <i.g.kuzmin.spb@gmail.com>
"
" ------------------------------------------------------------------------------

"  Details: {{{1
" Requires: Requires 6.0 or later  (this script is a plugin)
"           Requires <vis.vim>
"
"
" Usage:    Mark visual block (CTRL-V) or visual character (v),
"
" Author:
"
" ------------------------------------------------------------------------------
"nnoremap <leader>e :set operatorfunc=visEx#ExecuteOperator<cr>g@
vnoremap <leader>e :<c-u>call visEx#Exec()
" vim: foldmethod=marker
