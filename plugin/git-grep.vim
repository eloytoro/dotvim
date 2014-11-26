function! s:gitgrep(rgxp) abort
    let entries = []
    let lines = split(system('git grep -n -E '.a:rgxp.' | cat'), '\n')
    if v:shell_error != 0 | continue | endif
    for line in lines
        let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
        call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
    endfor
    if !empty(entries)
        call setqflist(entries)
        copen
        nnoremap <buffer> <CR> :.cc<CR>
    endif
endfunction

command! -nargs=1 GitGrep call s:gitgrep(<f-args>)
