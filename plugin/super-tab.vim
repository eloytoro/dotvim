" ----------------------------------------------------------------------------
" <tab> / <s-tab> / <c-v><tab> | super-duper-tab
" ----------------------------------------------------------------------------
function! s:super_duper_tab(command)
    call UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res == 0
        let line = getline('.')
        let col = col('.') - 2
        if !empty(line) && line[col] =~ '\k' && line[col + 1] !~ '\k'
            if a:command == 'p'
                return "\<c-p>"
            else
                return "\<c-n>"
            endif
        else
            if a:command == 'n'
                return "\<tab>"
            else
                return "\<s-tab>"
            endif
        endif
    endif
    return ""
endfunction
imap <script> <tab> <c-r>=<SID>super_duper_tab('p')<cr>
imap <script> <s-tab> <c-r>=<SID>super_duper_tab('n')<cr>
