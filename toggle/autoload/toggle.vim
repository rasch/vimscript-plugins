function! toggle#colorcolumn()
  if strlen(&l:colorcolumn)
    setlocal colorcolumn=
  else
    let &l:colorcolumn = &l:textwidth == 0 ? '81' : '+1'
  endif
endfunction

function! toggle#quickfix()
  if len(filter(range(1, winnr('$')), 'getwinvar(v:val, "&l:ft") ==# "qf"'))
    cclose
    execute s:quickfix_return_to_window . 'wincmd w'
  else
    let s:quickfix_return_to_window = winnr()
    cwindow
  endif
endfunction

function! toggle#cursorCrosshairs()
  if &l:cursorline && &l:cursorcolumn
    setlocal nocursorline nocursorcolumn
  else
    setlocal cursorline cursorcolumn
  endif
endfunction

function! toggle#distractionFree()
  if exists('s:state')
    " Restore options from state.
    let &l:cursorline = s:state.cursorline
    let &l:number = s:state.number
    let &l:relativenumber = s:state.relativenumber
    let &l:cursorcolumn = s:state.cursorcolumn
    let &l:colorcolumn = s:state.colorcolumn
    let &ruler = s:state.ruler
    let &laststatus = s:state.laststatus
    let &showtabline = s:state.showtabline

    " Clear state.
    unlet s:state
  else
    " Save state.
    let s:state = {
      \ 'cursorline': &cursorline,
      \ 'number': &number,
      \ 'relativenumber': &relativenumber,
      \ 'cursorcolumn': &cursorcolumn,
      \ 'colorcolumn': &colorcolumn,
      \ 'ruler': &ruler,
      \ 'laststatus': &laststatus,
      \ 'showtabline': &showtabline,
    \}

    " Disable Vim interface.
    setlocal nocul nonu nornu nocuc cc=
    set noru ls=0 stal=0
  endif
endfunction
