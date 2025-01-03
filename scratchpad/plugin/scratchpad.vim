if exists('g:loaded_scratchpad')
  finish
endif

let g:loaded_scratchpad = 1

let s:save_cpo = &cpo
set cpo&vim

if !exists(':Scratch')
  command! -nargs=* -bar -bang Scratch
    \ :call scratchpad#new('<mods> enew<bang>', <q-args>)
endif

if !exists(':VScratch')
  command! -nargs=* -bar VScratch
    \ :call scratchpad#new('<mods> vnew', <q-args>)
endif

if !exists(':SScratch')
  command! -nargs=* -bar -range=10 SScratch
    \ :call scratchpad#new('<mods> <count>new', <q-args>)
endif

if !exists(':PScratch')
  command! -nargs=* -bar -range=% PScratch
    \ :call scratchpad#paste(<line1>, <line2>, '<mods>', <q-args>)
endif

" This function is used to set default mappings if not defined already.
function! s:SetDefaultKeyBinding(name, keybind, mode)
  if !hasmapto('<Plug>' . a:name) && maparg(a:keybind, a:mode) == ''
    execute a:mode . 'map' '<unique>' a:keybind '<Plug>' . a:name
  endif
endfunction

call <SID>SetDefaultKeyBinding('Scratch', '<Leader>se', 'n')
nmap <silent> <Plug>Scratch :Scratch<CR>

call <SID>SetDefaultKeyBinding('VScratch', '<Leader>sv', 'n')
nmap <silent> <Plug>VScratch :VScratch<CR>

call <SID>SetDefaultKeyBinding('SScratch', '<Leader>ss', 'n')
nmap <silent> <Plug>SScratch :SScratch<CR>

call <SID>SetDefaultKeyBinding('PScratch', '<Leader>sp', 'n')
nmap <silent> <Plug>PScratch :call scratchpad#paste(0, 0, '', '')<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
