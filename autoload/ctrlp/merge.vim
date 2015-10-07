if (exists('g:loaded_ctrlp_merge') && g:loaded_ctrlp_merge)
            \ || v:version < 700 || &cp
    finish
endif

let g:loaded_ctrlp_merge = 1

let s:merge_var = {
            \ 'init': 'ctrlp#merge#init()',
            \ 'accept': 'ctrlp#merge#accept',
            \ 'lname': 'merge',
            \ 'sname': 'merge',
            \ 'type': 'line',
            \ 'sort': 0,
            \ }

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
    let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:merge_var)
else
    let g:ctrlp_ext_vars = [s:merge_var]
endif

function! ctrlp#merge#init()
    let entries = []
    let lines = split(system('git branch -r --no-merged'), '\n')
    if v:shell_error != 0 | continue | endif
    for line in lines
        call add(entries, line)
    endfor
    return entries
endfunction

func! ctrlp#merge#accept(mode, str)
    call ctrlp#exit()
    exec "silent !git merge --no-ff --no-commit ".a:str
    Gstatus
endfunc

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
func! ctrlp#merge#id()
    return s:id
endfun
