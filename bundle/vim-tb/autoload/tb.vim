" --- Init plugin --- {{{
if exists("b:loaded_tb")
    finish
endif
let b:loaded_tb = 1

"set shellpipe+=\ 

" }}} --- init plugin

function tb#init() " --- {{{
  if filereadable(".tbexrc")
    source ./.tbexrc
  endif

  call s:set_makeprg(s:makeprg_id, 0)

endfunction " }}} ---

" --- Makeprg {{{
  let s:makeprg_id = 0
  let s:variant_count = 2

  function s:set_makeprg(id, verbose)
    if a:id == 0
      setlocal makeef=.quickfix
      setlocal grepprg=grep-wrapper
      setlocal makeprg=clang-check-wrapper\ %
      setlocal shellpipe=
      if (a:verbose)
        echo 'Use clang-check'
      endif
    else
      setlocal makeef=
      setlocal grepprg=grep\ %\ -n
      setlocal makeprg=b\ -s\ RECURSIVE=NO
      setlocal shellpipe=2>&1\|\ tee
      if (a:verbose == 1)
        echo 'Use tbmake'
      endif
    endif
  endfunction

  function tb#switch_makeprg()
    let s:makeprg_id = (s:makeprg_id + 1) % s:variant_count
    call s:set_makeprg(s:makeprg_id, 1)
  endfunction

  command TBSwMakeprg call tb#switch_makeprg()
" }}} --- makeprg

" vim: ts=2 sw=2 st=2 sts=2 fdm=marker
