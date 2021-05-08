scriptencoding utf-8
" Vue
"
" ---> 修改不同类型文件的设置
augroup file_set
  autocmd FileType vue
        \ setlocal fileformat=unix |
        \ setlocal tabstop=2 |
        \ setlocal softtabstop=2 |
        \ setlocal shiftwidth=2 |
        \syntax sync fromstart
augroup end

" ---> vim vue
Plug 'posva/vim-vue', {'for': 'vue'}

" ---> ale fixer
if exists('g:ale_fixers')
  let g:ale_fixers.vue = ['eslint',]
endif
