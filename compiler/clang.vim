" vim compiler file
" Compiler:		clang (Apple c compiler)
" Last Change:  2016 Dec 16

" --- Init compiler {{{
  if exists('current_compiler')
    finish
  endif
  let current_compiler = 'clang'

  if exists(':CompilerSet') != 2
    command -nargs=* CompilerSet setlocal <args>
  endif

" }}} --- init 

" --- Error Format --- {{{
  let s:cpo_save = &cpo
  set cpo-=C "Do not concatenate sourced lines that start with a backslash

  "CompilerSet errorformat=
  "    \%f:%l:%c:\ %trror:\ %m,
  "    \%f:%l:%c:\ %tarning:\ %m,
  "    \%-G%.%#

  "CompilerSet errorformat=
  "    \%-G---%.%#,
  "    \%-G#%.%#,
  "    \%E\%f:%l:%c:\ %trror:\ %m,
  "    \%I\%f:%l:%c:\ note:\ %m,
  "    \%W\%f:%l:%c:\ %tarning:\ %m,
  "    \%C%.%#,
  "    \%Z%%s^

  CompilerSet errorformat=
      \%-G[ccache]%.%#,
      \%-G---%.%#,
      \%-G#%.%#,
      \%E%f:%l:%c:\ error:\ %m,
      \%W%f:%l:%c:\ warning:\ %m,
"      \%C%.%#
"      \%I\%f:%l:%c:\ note:\ %m,


  "setlocal errorformat  =%f:%l:%c:\ %trror:\ %m
  "setlocal errorformat +=%f:%l:%c:\ %tarning:\ %m
  "setlocal errorformat +=%-G%.%#

  let &cpo = s:cpo_save
  unlet s:cpo_save

" }}} --- errorformat

" vim: ts=2 sw=2 st=2 sts=2 fdm=marker

