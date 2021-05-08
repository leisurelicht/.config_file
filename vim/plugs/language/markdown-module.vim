scriptencoding utf-8
" Markdown
"
" ---> run file
augroup run_file
  autocmd FileType markdown noremap <F12> :MarkdownPreview<CR>
  autocmd BufWinLeave *.md call plugs#markdown#PreviewStop()
augroup end

" ---> 修改不同类型文件的设置
augroup file_set
  autocmd FileType markdown
        \ setlocal fileformat=unix |
        \ setlocal tabstop=4 |
        \ setlocal softtabstop=4 |
        \ setlocal shiftwidth=4 |
augroup end

" ---> 自动生成目录
Plug 'mzlogin/vim-markdown-toc', {'for': 'markdown'}

" ---> 实时预览
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install', 'for': 'markdown'}
let g:mkdp_auto_close = 0

" ---> ale fixer
if exists('g:ale_fixers')
  let g:ale_fixers.markdown = ['prettier']
endif
