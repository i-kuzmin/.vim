if exists("b:loaded_tbmake")
  finish
endif

let b:loaded_tbmake = 1

echom "cpp::tbmake load..."
compiler clang

call tb#init()
" map tb:switch_makeprg

"let b:undo_ftplugin=


