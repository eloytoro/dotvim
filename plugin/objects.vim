" ----------------------------------------------------------------------------
" Text Objects (indent, line)
" ----------------------------------------------------------------------------
function! s:indent_len(str)
    return type(a:str) == 1 ? len(matchstr(a:str, '^\s*')) : 0
endfunction

function! s:indent_object(op, skip_blank, b, e, bd, ed)
    let i = min([s:indent_len(getline(a:b)), s:indent_len(getline(a:e))])
    let x = line('$')
    let d = [a:b, a:e]

    if i == 0 && empty(getline(a:b)) && empty(getline(a:e))
        let [b, e] = [a:b, a:e]
        while b > 0 && e <= line('$')
            let b -= 1
            let e += 1
            let i = min(filter(map([b, e], 's:indent_len(getline(v:val))'), 'v:val != 0'))
            if i > 0
                break
            endif
        endwhile
    endif

    for triple in [[0, 'd[o] > 1', -1], [1, 'd[o] < x', +1]]
        let [o, ev, df] = triple

        while eval(ev)
            let line = getline(d[o] + df)
            let idt = s:indent_len(line)

            if eval('idt '.a:op.' i') && (a:skip_blank || !empty(line)) || (a:skip_blank && empty(line))
                let d[o] += df
            else | break | end
        endwhile
    endfor
    execute printf('normal! %dGV%dG', max([1, d[0] + a:bd]), min([x, d[1] + a:ed]))
endfunction
vnoremap <silent> ii :<c-u>call <SID>indent_object('>=', 1, line("'<"), line("'>"), 0, 0)<cr>
onoremap <silent> ii :<c-u>call <SID>indent_object('>=', 1, line('.'), line('.'), 0, 0)<cr>
vnoremap <silent> ai :<c-u>call <SID>indent_object('>=', 1, line("'<"), line("'>"), -1, 1)<cr>
onoremap <silent> ai :<c-u>call <SID>indent_object('>=', 1, line('.'), line('.'), -1, 1)<cr>
vnoremap <silent> io :<c-u>call <SID>indent_object('==', 0, line("'<"), line("'>"), 0, 0)<cr>
onoremap <silent> io :<c-u>call <SID>indent_object('==', 0, line('.'), line('.'), 0, 0)<cr>
function! s:go_indent(times, dir)
    for _ in range(a:times)
        let l = line('.')
        let x = line('$')
        let i = s:indent_len(getline(l))
        let e = empty(getline(l))

        while l >= 1 && l <= x
            let line = getline(l + a:dir)
            let l += a:dir
            if s:indent_len(line) != i || empty(line) != e
                break
            endif
        endwhile
        let l = min([max([1, l]), x])
        execute 'normal! '. l .'G^'
    endfor
endfunction
nnoremap <silent> ]i :<c-u>call <SID>go_indent(v:count1, 1)<cr>
nnoremap <silent> [i :<c-u>call <SID>go_indent(v:count1, -1)<cr>

" ----------------------------------------------------------------------------
" ?ie | entire object
" ----------------------------------------------------------------------------
vnoremap <silent> ie gg0oG$
onoremap <silent> ie :<C-U>execute "normal! m`" <Bar> keepjumps normal! ggVG<CR>

" ----------------------------------------------------------------------------
" ?il | inner line
" ----------------------------------------------------------------------------
vnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<CR>

" ----------------------------------------------------------------------------
" ?i_ ?a_ ?i. ?a. ?i, ?a, ?i/
" ----------------------------------------------------------------------------
function! s:between_the_chars(incll, inclr, char, vis)
    let cursor = col('.')
    let line   = getline('.')
    let before = line[0 : cursor - 1]
    let after  = line[cursor : -1]
    let [b, e] = [cursor, cursor]
    let s:btc  = 1

    try
        let i = stridx(join(reverse(split(before, '\zs')), ''), a:char)
        if i < 0 | throw 'exit' | end
        let b = len(before) - i + (a:incll ? 0 : 1)

        let i = stridx(after, a:char)
        if i < 0 | throw 'exit' | end
        let e = cursor + i + 1 - (a:inclr ? 0 : 1)

        execute printf("normal! 0%dlhv0%dlh", b, e)
    catch 'exit'
        let s:btc = 0
        if a:vis
            normal! gv
        endif
        " Undo invalid change on repeat
        if v:operator == 'c'
            let &l:undolevels = &l:undolevels
            augroup btc_undo_invalid_change
                autocmd InsertLeave <buffer> execute 'normal! u' | autocmd! btc_undo_invalid_change
            augroup END
        endif
    finally
        " Cleanup command history
        if histget(':', -1) =~ '<SNR>[0-9_]*between_the_chars('
            call histdel(':', -1)
        endif
        echo
    endtry
endfunction

" To exit insert mode immediately on fail
function! s:btc_after()
    if s:btc
        return ''
    else
        autocmd! btc_undo_invalid_change
        return "\<esc>" . (col('.') > 1 ? 'l' : '')
    endif
endfunction

noremap         <Plug>(BTC) <c-l>
inoremap <expr> <Plug>(BTC) <sid>btc_after()

for [s:c, s:l] in items({'_': 0, '.': 0, ',': 0, '/': 1})
    execute printf("vmap <silent> i%s :<C-U>call <SID>between_the_chars(0,  0, '%s', 1)<CR><Plug>(BTC)", s:c, s:c)
    execute printf("omap <silent> i%s :<C-U>call <SID>between_the_chars(0,  0, '%s', 0)<CR><Plug>(BTC)", s:c, s:c)
    execute printf("vmap <silent> a%s :<C-U>call <SID>between_the_chars(%s, 1, '%s', 1)<CR><Plug>(BTC)", s:c, s:l, s:c)
    execute printf("omap <silent> a%s :<C-U>call <SID>between_the_chars(%s, 1, '%s', 0)<CR><Plug>(BTC)", s:c, s:l, s:c)
endfor
