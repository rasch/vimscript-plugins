if exists('g:loaded_toggle')
  finish
endif

let g:loaded_toggle = 1

let s:save_cpo = &cpo
set cpo&vim

" Distraction free mode using :DF command.
if !exists(':DF')
  command! -bar DF :call toggle#distractionFree()
endif

" This function is used to set default mappings if not defined already.
function! s:SetDefaultKeyBinding(name, keybind, mode)
  if !hasmapto('<Plug>' . a:name) && maparg(a:keybind, a:mode) == ''
    execute a:mode . 'map' '<unique>' a:keybind '<Plug>' . a:name
  endif
endfunction

" [b]ackground
call <SID>SetDefaultKeyBinding('ToggleBackground', '<Leader>tb', 'n')
nmap <expr> <Plug>ToggleBackground
  \ ':set background=' . (&background == 'dark' ? 'light' : 'dark') . '<CR>'

" [c]ursorline
call <SID>SetDefaultKeyBinding('ToggleCursorline', '<Leader>tc', 'n')
nmap <expr> <Plug>ToggleCursorline
  \ ':setlocal ' . (&cursorline ? 'no' : '') . 'cursorline<CR>'

" [d]istraction free
call <SID>SetDefaultKeyBinding('ToggleDistractionFree', '<Leader>td', 'n')
nmap <silent> <Plug>ToggleDistractionFree :call toggle#distractionFree()<CR>

" [f]oldcolumn
call <SID>SetDefaultKeyBinding('ToggleFoldcolumn', '<Leader>tf', 'n')
nmap <expr> <Plug>ToggleFoldcolumn
  \ ':setlocal foldcolumn=' . (&foldcolumn ? 0 : 4) . '<CR>'

" [h]lsearch
call <SID>SetDefaultKeyBinding('ToggleHlsearch', '<Leader>th', 'n')
nmap <expr> <Plug>ToggleHlsearch
  \ ':set ' . (&hlsearch ? 'no' : '') . 'hlsearch<CR>'

" [i]gnorecase
call <SID>SetDefaultKeyBinding('ToggleIgnorecase', '<Leader>ti', 'n')
nmap <expr> <Plug>ToggleIgnorecase
  \ ':set ' . (&ignorecase ? 'no' : '') . 'ignorecase<CR>'

" [l]ist
call <SID>SetDefaultKeyBinding('ToggleList', '<Leader>tl', 'n')
nmap <expr> <Plug>ToggleList
  \ ':setlocal ' . (&list ? 'no' : '') . 'list<CR>'

" [n]umber
call <SID>SetDefaultKeyBinding('ToggleNumber', '<Leader>tn', 'n')
nmap <expr> <Plug>ToggleNumber
  \ ':setlocal ' . (&number ? 'no' : '') . 'number<CR>'

" c[o]lorcolumn
call <SID>SetDefaultKeyBinding('ToggleColorcolumn', '<Leader>to', 'n')
nmap <silent> <Plug>ToggleColorcolumn :call toggle#colorcolumn()<CR>

" [q]uickfix
call <SID>SetDefaultKeyBinding('ToggleQuickfix', '<Leader>tq', 'n')
nmap <silent> <Plug>ToggleQuickfix :call toggle#quickfix()<CR>

" [r]elativenumber
call <SID>SetDefaultKeyBinding('ToggleRelativenumber', '<Leader>tr', 'n')
nmap <expr> <Plug>ToggleRelativenumber
  \ ':setlocal ' . (&relativenumber ? 'no' : '') . 'relativenumber<CR>'

" [s]pell
call <SID>SetDefaultKeyBinding('ToggleSpell', '<Leader>ts', 'n')
nmap <expr> <Plug>ToggleSpell
  \ ':setlocal ' . (&spell ? 'no' : '') . 'spell<CR>'

" c[u]rsorcolumn
call <SID>SetDefaultKeyBinding('ToggleCursorcolumn', '<Leader>tu', 'n')
nmap <expr> <Plug>ToggleCursorcolumn
  \ ':setlocal ' . (&cursorcolumn ? 'no' : '') . 'cursorcolumn<CR>'

" [w]rap
call <SID>SetDefaultKeyBinding('ToggleWrap', '<Leader>tw', 'n')
nmap <expr> <Plug>ToggleWrap
  \ ':setlocal ' . (&wrap ? 'no' : '') . 'wrap<CR>'

" [x] cursorline and cursorcolumn
call <SID>SetDefaultKeyBinding('ToggleCrosshairs', '<Leader>tx', 'n')
nmap <silent> <Plug>ToggleCrosshairs :call toggle#cursorCrosshairs()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
