"--------------------------------------------------
"    Vundle
"--------------------------------------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-git'
Plugin 'jisaacks/GitGutter'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/seoul256.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'svermeulen/vim-easyclip'
Plugin 'bling/vim-airline'
Plugin 'xsbeats/vim-blade'
Plugin 'kshenoy/vim-signature'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'ervandew/supertab'

call vundle#end()

"--------------------------------------------------
"    Colorschemes
"--------------------------------------------------
syntax enable
"colorscheme distinguished
"colorscheme BusyBee
"colorscheme jellybeans
colorscheme xoria256

"--------------------------------------------------
"    Sets
"--------------------------------------------------
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
set cursorline
set incsearch
set wildmenu
let g:html_indent_inctags = "html,body,head,tbody"
set shiftwidth=4
set tabstop=4

"--------------------------------------------------
"    fix indent
"--------------------------------------------------
au BufReadPost *.rkt,*.rktl set filetype=scheme
au filetype racket set lisp
au filetype racket set autoindent
filetype plugin indent on
autocmd BufNewFile,BufRead *.blade.php set ft=html | set ft=phtml | set ft=blade " Fix blade auto-indent

"--------------------------------------------------
"    maps
"--------------------------------------------------
map <F2> :source ~/.vimrc<CR>
nmap <Space><Space> o<Esc>
inoremap {<CR> {<CR><CR>}<Up><Esc>"_cc
inoremap (<CR> (<CR><CR>)<Up><Esc>"_cc
vnoremap > >gv
vnoremap < <gv
"--------------------------------------------------
"    switch L and H with ^ and $
"--------------------------------------------------
omap L $
map H ^
map L $
"--------------------------------------------------
"    unnecesary yank register overwrites
"--------------------------------------------------
nmap cd :cd %:p:h<CR>
"--------------------------------------------------
"    window controls
"--------------------------------------------------
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l
map <C-Down> 2<C-W>-
map <C-Up> 2<C-W>+
map <C-Right> 2<C-W>>
map <C-Left> 2<C-W><

"--------------------------------------------------
"    tpope
"--------------------------------------------------
set complete-=i
set dictionary+=/usr/share/dict/words
set virtualedit=block
set backupdir=~/.vim/backup
set directory=~/.vim/backup
set laststatus=2
set pastetoggle=<F4>
set smarttab
set splitbelow
set visualbell

"--------------------------------------------------
"    Easymotion
"--------------------------------------------------
map E <Plug>(easymotion-prefix)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
let g:EasyMotion_smartcase = 1

"--------------------------------------------------
"    Nerdtree
"--------------------------------------------------
map gn :NERDTreeToggle<CR>

"--------------------------------------------------
"    Airline
"--------------------------------------------------
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

"--------------------------------------------------
"    Easyclip
"--------------------------------------------------
let g:EasyClipUseSubstituteDefaults = 1
let g:EasyClipAutoFormat = 1
let g:EasyClipPreserveCursorPositionAfterYank = 1
nmap M mL

"--------------------------------------------------
"    Signature
"--------------------------------------------------
let g:SignatureMap = { 'Leader' :  "gm" }
let g:SignatureMarkOrder = "'\m"

if has ("gui_running")
	set guioptions=agim
	set background=dark
	colorscheme Tomorrow-Night
	set guicursor+=a:blinkon0
	set guifont=Consolas:h13
endif

set encoding=utf-8

function! s:hl()
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
command! HL call <SID>hl()

"--------------------------------------------------
"    Text Objects (indent, line)
"--------------------------------------------------
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

"--------------------------------------------------
"    Colorscheme rotation
"--------------------------------------------------
function! s:rotate_colors()
	if !exists("s:colors_list")
		let s:colors_list =
					\ sort(map(
					\   filter(split(globpath(&rtp, "colors/*.vim"), "\n"), 'v:val !~ "^/usr/"'),
					\   "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"))
	endif
	if !exists("s:colors_index")
		let s:colors_index = index(s:colors_list, g:colors_name)
	endif
	let s:colors_index = (s:colors_index + 1) % len(s:colors_list)
	let name = s:colors_list[s:colors_index]
	execute "colorscheme " . name
	redraw
	echo name
endfunction
nnoremap <F8> :call <SID>rotate_colors()<cr>
