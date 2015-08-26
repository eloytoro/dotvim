" ----------------------------------------------------------------------------
" <tab> / <s-tab> / <c-v><tab> | super-duper-tab
" ----------------------------------------------------------------------------
function! s:can_complete(func, prefix)
    if empty(a:func) || call(a:func, [1, '']) < 0
        return 0
    endif
    let result = call(a:func, [0, matchstr(a:prefix, '\k\+$')])
    return !empty(type(result) == type([]) ? result : result.words)
endfunction

function! s:super_duper_tab(k, o)
    if pumvisible()
        return a:k
    endif

    let line = getline('.')
    let col = col('.') - 2
    if line[col] !~ '\k\|[/~.]'
        return a:o
    endif

    let prefix = expand(matchstr(line[0:col], '\S*$'))
    if prefix =~ '^[~/.]'
        return "\<c-x>\<c-f>"
    endif
    if s:can_complete(&omnifunc, prefix)
        return "\<c-x>\<c-o>"
    endif
    if s:can_complete(&completefunc, prefix)
        return "\<c-x>\<c-u>"
    endif
    return a:k
endfunction

if has_key(g:plugs, 'ultisnips')
    let g:SuperTabMappingForward  = "<tab>"
    let g:SuperTabMappingBackward = "<s-tab>"
    if !exists(':UltiSnipsEdit')
        inoremap <Plug>(tab) <c-r>=plug#load('ultisnips')?UltiSnips#ExpandSnippet():"<tab>"<cr>
        imap <tab> <Plug>(tab)
    endif
    function! SuperTab(m)
        return s:super_duper_tab(a:m == 'n' ? "\<c-n>" : "\<c-p>",
                    \ a:m == 'n' ? "\<tab>" : "\<s-tab>")
    endfunction
else
    inoremap <expr> <tab>   <SID>super_duper_tab("\<c-n>", "\<tab>")
    inoremap <expr> <s-tab> <SID>super_duper_tab("\<c-p>", "\<s-tab>")
endif
