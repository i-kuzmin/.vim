" vim compiler file
" Compiler:		clang (Apple c compiler)
" Last Change:  2016 Dec 16

" --- Init compiler {{{

  if exists("clang")
    finish
  endif
  let clnag = 1
  let current_compiler = "clang"

" }}} --- init 

" --- Error Format --- {{{

  let s:cpo_save = &cpo
  set cpo-=C "Do not concatenate sourced lines that start with a backslash

  setlocal errorformat  =%f:%l:%c:\ %trror:\ %m
  setlocal errorformat +=%f:%l:%c:\ %tarning:\ %m
  setlocal errorformat +=%-G%.%#

  let &cpo = s:cpo_save
  unlet s:cpo_save

" }}} --- errorformat

" vim: ts=2 sw=2 st=2 sts=2 fdm=marker

