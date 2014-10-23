" ----------------------------------------------------------------------------
" Vundle
" ----------------------------------------------------------------------------
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'eloytoro/jellybeans.vim'
Plug 'eloytoro/xoria256'
Plug 'eloytoro/web-snippets'
Plug 'SirVer/ultisnips'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'cakebaker/scss-syntax.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'svermeulen/vim-easyclip'
Plug 'bling/vim-airline'
Plug '4dma/vim-blade'
Plug 'kshenoy/vim-signature'
Plug 'Lokaltog/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'Yggdroot/indentLine'
Plug 'kien/ctrlp.vim'

call plug#end()

" ----------------------------------------------------------------------------
" Colorschemes
" ----------------------------------------------------------------------------
syntax enable
"colorscheme xoria256
colorscheme jellybeans
"let g:seoul256_background = 234
"colorscheme seoul256
"colorscheme distinguished

"set background = dark

" ----------------------------------------------------------------------------
" Basic
" ----------------------------------------------------------------------------
set backspace=2
set nu
set rnu
set showcmd
set ruler
set showmatch
set scrolloff=2
set wrap
set linebreak
set breakat-=*
set incsearch
set wildmenu
let g:html_indent_inctags = "html,body,head,tbody"
let mapleader = ' '
let maplocalleader = ' '
set shiftwidth=4
set tabstop=4
set autoread
set nosol
set expandtab smarttab
set virtualedit=block
set backupdir=~/.vim/backup
set directory=~/.vim/backup
set laststatus=2
set pastetoggle=<F4>
set splitbelow
set cursorline
set showbreak=\ ~\ 
set encoding=utf-8

" ----------------------------------------------------------------------------
" Fix Indent
" ----------------------------------------------------------------------------
au BufReadPost *.rkt,*.rktl set filetype=scheme
au filetype racket set lisp
au filetype racket set autoindent
filetype plugin indent on
autocmd BufNewFile,BufRead *.blade.php set ft=html | set ft=phtml | set ft=blade " Fix blade auto-indent

" ----------------------------------------------------------------------------
"  Tabs
" ----------------------------------------------------------------------------
set list listchars=tab:¦\ ,trail:·,extends:»,precedes:«,nbsp:×

" ----------------------------------------------------------------------------
" Maps
" ----------------------------------------------------------------------------
map <F2> :source ~/.vimrc<CR>
nmap - o<Esc>
nmap _ O<Esc>
inoremap {<CR> {<CR><CR>}<Up><Esc>"_cc
inoremap (<CR> (<CR><CR>)<Up><Esc>"_cc
nnoremap Q @q
nnoremap <tab> gt
nnoremap <S-tab> gT
nmap cd :cd %:p:h<CR>
noremap <C-F> <C-D>
noremap <C-B> <C-U>

" ----------------------------------------------------------------------------
"   Moving lines
" ----------------------------------------------------------------------------
nnoremap <silent> <C-k> :execute ":move ".max([0,         line('.') - 2])<cr>==
nnoremap <silent> <C-j> :execute ":move ".min([line('$'), line('.') + 1])<cr>==
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
vnoremap <silent> <C-k> :<C-U>execute "normal! gv:move ".max([0,         line("'<") - 2])."\n"<cr>gv
vnoremap <silent> <C-j> :<C-U>execute "normal! gv:move ".min([line('$'), line("'>") + 1])."\n"<cr>gv
vnoremap <silent> <C-h> <gv
vnoremap <silent> <C-l> >gv
vnoremap < <gv
vnoremap > >gv

" ----------------------------------------------------------------------------
" switch L and H with ^ and $
" ----------------------------------------------------------------------------
omap H ^
omap L $
map H ^
map L $

" ----------------------------------------------------------------------------
" Window Controls
" ----------------------------------------------------------------------------
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l
map <C-Down> 2<C-W>-
map <C-Up> 2<C-W>+
map <C-Right> 2<C-W>>
map <C-Left> 2<C-W><

" ----------------------------------------------------------------------------
" Easymotion
" ----------------------------------------------------------------------------
map  <Leader>  <Plug>(easymotion-prefix)
map  /         <Plug>(easymotion-sn)
omap /         <Plug>(easymotion-tn)
map  <Leader>l <Plug>(easymotion-lineanywhere)
omap <Leader>l <Plug>(easymotion-lineanywhere)
map  <Leader>w <Plug>(easymotion-bd-w)
omap <Leader>w <Plug>(easymotion-bd-w)
map  <Leader>W <Plug>(easymotion-bd-W)
omap <Leader>W <Plug>(easymotion-bd-W)
map  n         <Plug>(easymotion-next)
map  N         <Plug>(easymotion-prev)
map  <CR>      <Plug>(easymotion-repeat)
let  g:EasyMotion_enter_jump_first = 1
let  g:EasyMotion_smartcase = 1
hi   EasyMotionMoveHLDefault ctermfg=white ctermbg=black

" ----------------------------------------------------------------------------
" Status
" ----------------------------------------------------------------------------
nmap gs :Gstatus<CR>

" ----------------------------------------------------------------------------
" EasyAlign
" ----------------------------------------------------------------------------
vmap <Enter> <Plug>(EasyAlign)

" ----------------------------------------------------------------------------
" Nerdtree
" ----------------------------------------------------------------------------
map <Leader>n :NERDTreeToggle<CR>

" ----------------------------------------------------------------------------
" Airline
" ----------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_left_sep = '>'
let g:airline_right_sep = '«'
let g:airline_right_sep = '<'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_detect_whitespace = 0
let g:airline_theme = 'serene'

" ----------------------------------------------------------------------------
" Easyclip
" ----------------------------------------------------------------------------
let g:EasyClipUseSubstituteDefaults = 1
let g:EasyClipPreserveCursorPositionAfterYank = 1
let g:EasyClipAutoFormat = 1
nmap M mL

" ----------------------------------------------------------------------------
" Signature
" ----------------------------------------------------------------------------
let g:SignatureMap = { 'Leader' :  "gm" }
let g:SignatureMarkOrder = "'\m"

if has ("gui_running")
    set guioptions=agim
    set guicursor+=a:blinkon0
    set guifont=Inconsolata\ 13
endif

" ----------------------------------------------------------------------------
" IndentLine
" ----------------------------------------------------------------------------
let g:indentLine_color_term = 234
let g:indentLine_char = '¦'

" ----------------------------------------------------------------------------
"  CtrlP
" ----------------------------------------------------------------------------
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*,*/bower_components/*,*/node_modules/*
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_mru_files = 1

function! s:hl()
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
command! HL call <SID>hl()

" ----------------------------------------------------------------------------
"  GitGutter
" ----------------------------------------------------------------------------
nmap <leader>gh :GitGutterLineHighlightsToggle<CR>
nmap <leader>gp <Plug>GitGutterPreviewHunk

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
nnoremap <silent> gi :<c-u>call <SID>go_indent(v:count1, 1)<cr>
nnoremap <silent> gI :<c-u>call <SID>go_indent(v:count1, -1)<cr>

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
