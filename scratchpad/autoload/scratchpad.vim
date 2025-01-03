function! scratchpad#new(cmd, opts) abort
  execute 'belowright' a:cmd
  setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted

  if !empty(a:opts)
    execute 'setlocal' a:opts
  endif
endfunction

function! scratchpad#paste(start, end, mods, opts) abort
  if a:start && a:end
    let text = getline(a:start, a:end)
    let height = a:end - a:start + 3
  else
    let text = @@
    let height = len(split(@@, '\n')) + 2
  endif

  call scratchpad#new(a:mods . ' ' . height . 'new', a:opts)
  silent put =text
  1delete _
  filetype detect
endfunction
