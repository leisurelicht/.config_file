scriptencoding utf-8
" ---> Set Plugin Manager
" default:  <vim-plug>  use vim-plug
"           <dein>      use dein(in plan)
let g:plugin_manager = 'vim-plug'

" --> Supported Languages Module
" Markdown
" YAML
" Docker
" SQL
" Shell
" Vimscript
" Python
" Go
" Javascript
" Vue

" ---> Ale fixer
" default:  <1> enable
"           <0> disable
let g:ale_auto_fix_on_save = 1

" python2 path
" let g:_python2_path = '/full/path/to/python2'
" default: empty
" let g:_python2_path = '/usr/local/bin/python2'
let g:_python2_path = ''

" python3 path
" let g:_python3_path = '/full/path/to/python3'
" default: macos use python3 install by brew
" defautl: linux use /use/bin/python3
if utils#system#OSX()
  let g:_python3_path = '/usr/local/bin/python3'
elseif utils#system#LINUX()
  let g:_python3_path = '/usr/bin/python3'
else
  echom 'UnSupported Operation System'
endif

" perl path
" default: empty
let g:_perl_path = ''


" node path
" default: empty
let g:_node_path = ''
" let g:_node_path = '/usr/local/bin/neovim-node-host'

" ruby path
" default: empty
let g:_ruby_path = ''
