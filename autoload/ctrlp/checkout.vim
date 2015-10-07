if (exists('g:loaded_ctrlp_checkout') && g:loaded_ctrlp_checkout)
            \ || v:version < 700 || &cp
    finish
endif

let g:loaded_ctrlp_checkout = 1

let s:checkout_var = {
            \ 'init': 'ctrlp#checkout#init()',
            \ 'accept': 'ctrlp#checkout#accept',
            \ 'lname': 'checkout',
            \ 'sname': 'checkout',
            \ 'type': 'line',
            \ 'sort': 0,
            \ }

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
    let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:checkout_var)
else
    let g:ctrlp_ext_vars = [s:checkout_var]
endif

function! ctrlp#checkout#init()
    let entries = []
    let lines = split(system('git branch'), '\n')
    if v:shell_error != 0 | continue | endif
    let formatter = ['^\s*\*\?\s*', '', 'g']
    let [pat, str, flags] = [get(formatter, 0, ''), get(formatter, 1, ''), get(formatter, 2, '')]
    for line in lines
        "call add(entries, line)
        call add(entries, substitute(line, pat, str, flags))
    endfor
    return entries
endfunction

func! ctrlp#checkout#accept(mode, str)
    call ctrlp#exit()
    exec "silent !git checkout ".a:str
    Gstatus
endfunc

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
func! ctrlp#checkout#id()
    return s:id
endfun
