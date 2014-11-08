" ----------------------------------------------------------------------------
" <tab> / <s-tab> / <c-v><tab> | super-duper-tab
" ----------------------------------------------------------------------------
function! s:super_duper_tab_previous()
    call UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res == 0
        let line = getline('.')
        let col = col('.') - 2
        if !empty(line) && line[col] =~ '\k' && line[col + 1] !~ '\k'
            return "\<c-p>"
        else
            return "\<tab>"
        endif
    endif
    return ""
endfunction
function! s:super_duper_tab_next()
    call UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res == 0
        let line = getline('.')
        let col = col('.') - 2
        if !empty(line) && line[col] =~ '\k' && line[col + 1] !~ '\k'
            return "\<c-n>"
        else
            return "\<s-tab>"
        endif
    endif
    return ""
endfunction
imap <script> <tab> <c-r>=<SID>super_duper_tab_previous()<cr>
imap <script> <s-tab> <c-r>=<SID>super_duper_tab_next()<cr>
