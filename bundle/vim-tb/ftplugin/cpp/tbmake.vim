if exists("b:loaded_tbmake")
  finish
endif

let b:loaded_tbmake = 1

compiler clang

call tb#init()
noremap <unique> <buffer> <silent> <leader>tc :TBSwMakeprg<CR>
" map tb:switch_makeprg

"let b:undo_ftplugin=


