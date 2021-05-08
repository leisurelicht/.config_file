scriptencoding utf-8
" Javascript
"
" ---> 修改不同类型文件的设置
augroup file_set
  autocmd FileType javascrip.jsx, javascript
        \ setlocal fileformat=unix |
        \ setlocal tabstop=2 |
        \ setlocal softtabstop=2 |
        \ setlocal shiftwidth=2 |
augroup end

" ---> Makes your javascript files support React jsx correctly.
Plug 'chemzqm/vim-jsx-improve', {'for': 'javascript.jsx'}

" ---> ale fixer
if exists('g:ale_fixers')
  let g:ale_fixers.html = ['eslint',' importjs', 'prettier_eslint', 'prettier_standard']
endif
