scriptencoding utf-8
" 状态栏 airline
"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_theme = 'bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled=0

function! WindowNumber(...)
  let builder = a:1
  let context = a:2
  call builder.add_section('airline_b', '[%{tabpagewinnr(tabpagenr())}]➤')
  return 0
endfunction

augroup vim_enter
  autocmd VimEnter * call airline#add_statusline_func('WindowNumber')
  autocmd VimEnter * call airline#add_inactive_statusline_func('WindowNumber')
augroup end

" ---> enable ale
let g:airline#extensions#ale#enabled = 1

" ---> enable vim devicons
" let g:airline_powerline_fonts = 1
