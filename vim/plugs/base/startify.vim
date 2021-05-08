" startify
"
Plug 'mhinz/vim-startify'


if has('nvim')
  augroup vim_enter
    " autocmd VimEnter * if argc() == 0 | Startify | NERDTree | wincmd w | endif
    autocmd VimEnter * if !argc() | Startify | exe 'NERDTree' | wincmd w | endif
  augroup end

  augroup new_tab_enter
    autocmd TabNew * Startify
  augroup end

  " let g:webdevicons_enable_startify = 1
else
  augroup new_tab_enter
    autocmd VimEnter * let t:startify_new_tab = 1
    autocmd BufEnter *
          \ if !exists('t:startify_new_tab') && empty(expand('%')) |
          \   let t:startify_new_tab = 1 |
          \   Startify |
          \ endif
  augroup end
endif

let g:startify_custom_indices = map(range(1,100), 'string(v:val)')

function! s:nerdtreeBookmarks()
    let bookmarks = systemlist("cut -d' ' -f 2- ~/.NERDTreeBookmarks")
    let bookmarks = bookmarks[0:-2] " Slices an empty last line
    return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   NERDTree Bookmarks']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

" ---> enable vim devicons
