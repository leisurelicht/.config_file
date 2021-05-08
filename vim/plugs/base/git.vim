scriptencoding utf-8
" Git
"
" ---> 文件变动
Plug 'mhinz/vim-signify', {'on': 'NERDTree'}

" ---> Git命令
Plug 'tpope/vim-fugitive'

nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit %<CR>
nnoremap <leader>gh :Git push<CR>
nnoremap <leader>gl :Git pull<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gff :Git diff<CR>
nnoremap <leader>gft :Git difftool<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gd :GDelete<CR>

" ---> Commit browser
Plug 'junegunn/gv.vim', {'on': 'GV'}

nnoremap <leader>gvv :GV<CR>
nnoremap <leader>gvc :GV!<CR>
nnoremap <leader>gvl :GV?<CR>

" ---> Git Message
Plug 'rhysd/git-messenger.vim'

" ---> Coc git
let g:coc_global_extensions = ["coc-git"]
