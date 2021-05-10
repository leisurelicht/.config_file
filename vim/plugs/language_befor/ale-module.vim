scriptencoding utf-8
" ale
"

Plug 'w0rp/ale'

let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'nerver'
let g:ale_sign_column_always = 1
let g:ale_sign_error = '☠'
let g:ale_sign_warning = '★'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ OK']

" let g:ale_completion_enabled = 1

let g:ale_disable_lsp = 1

" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1

" let g:ale_open_list = 1
" " Set this if you want to.
" " This can be useful if you are combining ALE with
" " some other plugin which sets quickfix errors, etc.
" let g:ale_keep_list_window_open = 1

let g:ale_fix_on_save = g:ale_auto_fix_on_save
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace', 'prettier', 'eslint']}

highlight ALEWarning ctermfg=236 ctermbg=182 guifg=#303030 guibg=#d7afd7
highlight ALEError ctermfg=238 ctermbg=110 guifg=#444444 guibg=#87afd7
highlight ALEStyleError ctermfg=238 ctermbg=110 guifg=#444444 guibg=#87afd7

nnoremap <silent> <C-n> <Plug>(ale_previous_wrap)
nnoremap <silent> <C-p> <Plug>(ale_next_wrap)

nnoremap <leader>ae :ALEEnable<CR>
nnoremap <leader>ad :ALEDisable<CR>
nnoremap <leader>aa :call plugs#ale#AutoFix()<CR>
nnoremap <leader>af :ALEFix<CR>
nnoremap <leader>aF :ALEFixSuggest<CR>
nnoremap <leader>an :ALENext<CR>
nnoremap <leader>ap :ALEPrevious<CR>
