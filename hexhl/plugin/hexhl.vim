if !(has('termguicolors') && &termguicolors || has('gui_running'))
  finish
endif

if v:version < 700 || exists('g:loaded_hexhl')
  finish
endif

let g:loaded_hexhl = 1

let s:save_cpo = &cpo
set cpo&vim

if !exists(':HexHl')
  command! HexHl
    \ :call hexhl#clear() | call hexhl#render(1, '$') | call hexhl#css_colors()
endif

if !exists(':HexHlClear')
  command! HexHlClear :call hexhl#clear()
endif

augroup hexhl
  autocmd!
  autocmd BufWinEnter,Syntax,ColorScheme * HexHl
  autocmd TextChanged,TextChangedI * call hexhl#render('.', '.')
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
