function! Entry#Begin() abort

  call utils#util#UserConfig('init.vim')

  if has('nvim')
    " https://neovim.io/doc/user/provider.html
    if g:_python2_path ==? ''
      let g:loaded_python_provider = 0
    else
      let g:python_host_prog = g:_python2_path
    endif

    if g:_python3_path ==? '' 
      let g:loaded_python3_provider = 0
    else
      let g:python3_host_prog = g:_python3_path
    endif

    if g:_perl_path ==? '' 
      let g:loaded_perl_provider = 0
    else
      let g:perl_host_prog = g:_perl_path
    endif

    if g:_node_path ==? ''
      let g:loaded_node_provider = 0
    else
      let g:node_host_prog = g:_node_path
    endif

    if g:_ruby_path ==? ''
      let g:loaded_ruby_provider = 0
    else
      let g:ruby_host_prog = g:_ruby_path
    endif

  endif

  call utils#util#SystemConfig('config.vim')
  call utils#util#SystemConfig('alias.vim')
  call utils#util#SystemConfig('action.vim')

  call plugs#manager#check()
  if g:_vim_plug_installed ==# 1
    call utils#util#SystemConfig('vim-plug.vim')
  elseif g:_dein_installed ==# 1
    " TODO
  endif

endfunction
