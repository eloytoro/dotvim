function! s:grep(rgxp) abort
    let entries = []
    let lines = split(system('git grep -n -E '.a:rgxp.' | cat'), '\n')
    if v:shell_error != 0 | continue | endif
    for line in lines
        let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
        call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
    endfor
    if !empty(entries)
        call setloclist(0, entries)
        lopen
        nnoremap <buffer> <CR> :.ll<CR>
    endif
endfunction

command! -nargs=1 Grep call s:grep(<f-args>)
