scriptencoding utf-8
" Go
"
" ---> run file
augroup run_file
  autocmd FileType go noremap <buffer> <F12> :call custom#run#Go()<CR>
augroup end


" ---> 修改不同类型文件的设置
augroup file_set
  autocmd FileType go
        \ setlocal fileformat=unix |
        \ setlocal tabstop=4 |
        \ setlocal softtabstop=4 |
        \ setlocal shiftwidth=4 |
        \ setlocal colorcolumn=80 |
augroup end

" ---> vim-go
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go'}

" ---> ale fixer
if exists('g:ale_fixers')
  let g:ale_fixers.go = ['goimports', 'gofmt']
endif
