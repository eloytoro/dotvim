function! s:hl()
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
command! HL call <SID>hl()
