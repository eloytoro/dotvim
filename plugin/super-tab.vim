" ----------------------------------------------------------------------------
" <tab> / <s-tab> / <c-v><tab> | super-duper-tab
" ----------------------------------------------------------------------------
function! s:super_duper_tab(k, o)
    let line = getline('.')
    let col = col('.') - 2
    if !empty(line) && line[col] =~ '\k' && line[col + 1] !~ '\k' || pumvisible()
        return a:k
    else
        return a:o
    endif
endfunction

imap <expr><tab> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: <SID>super_duper_tab("\<c-p>", "\<tab>")

imap <expr><s-tab> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: <SID>super_duper_tab("\<c-n>", "\<s-tab>")

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<TAB>"
