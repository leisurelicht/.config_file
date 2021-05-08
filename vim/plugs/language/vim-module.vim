scriptencoding utf-8
" Vim
"
" ---> 修改不同类型文件的设置
augroup file_set
  autocmd FileType vim
        \ setlocal fileformat=unix |
        \ setlocal tabstop=2 |
        \ setlocal softtabstop=2 |
        \ setlocal shiftwidth=2 |
augroup end


" ---> ale fixer
if exists('g:ale_fixers')
  let g:ale_fixers.vim = []
endif
