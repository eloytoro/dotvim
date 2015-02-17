" ----------------------------------------------------------------------------
" <tab> / <s-tab> / <c-v><tab> | super-duper-tab
" ----------------------------------------------------------------------------
function! s:super_duper_tab(k, o)
    let line = getline('.')
    let col = col('.') - 2
    if !empty(line) && line[col] =~ '\k' && line[col + 1] !~ '\k'
        return a:k
    else
        return a:o
    endif
endfunction
inoremap <expr> <tab>   <SID>super_duper_tab("\<c-n>", "\<tab>")
inoremap <expr> <s-tab> <SID>super_duper_tab("\<c-p>", "\<s-tab>")
