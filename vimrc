"Useful vim tips
" vit <xml>(text)</xml>
" vat (<xml>text</xml>)

execute pathogen#infect()

syntax enable
colorscheme wasp

"Sets
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

"indent
au BufReadPost *.rkt,*.rktl set filetype=scheme
au filetype racket set lisp
au filetype racket set autoindent
filetype plugin indent on
autocmd BufNewFile,BufRead *.blade.php set ft=html | set ft=phtml | set ft=blade " Fix blade auto-indent

"maps
map <F2> :source ~/.vimrc<CR>
vmap il <Esc>^v$h
nnoremap ^ L
nnoremap $ H
nnoremap L $
nnoremap H ^
vnoremap p "_dP
map s <NOP>
vnoremap s "tyqs
nnoremap gn gn"_dPn
vnoremap n "tyq/"tp<CR>gn
nnoremap x "_x
nmap cd :cd %:p:h<CR>
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l
map <C-Down> <C-W>+
map <C-Up> <C-W>-
map <C-Right> <C-W><
map <C-Left> <C-W>>
nmap <Space><Space> o<Esc>

"tpope
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

"Easymotion
let g:EasyMotion_do_mapping = 0 " Disable all mappings
map  <Space>w <Plug>(easymotion-w)
map  <Space>W <Plug>(easymotion-W)
map  <Space>b <Plug>(easymotion-b)
map  <Space>B <Plug>(easymotion-B)
map  <Space>/ <Plug>(easymotion-sn)
omap <Space>/ <Plug>(easymotion-tn)
map  <Space>f <Plug>(easymotion-s)
map  <Space>j <Plug>(easymotion-j)
map  <Space>k <Plug>(easymotion-k)
map  <Space>l <Plug>(easymotion-lineforward)
map  <Space>h <Plug>(easymotion-linebackward)
map  <Space>f <Plug>(easymotion-f)
map  <Space>F <Plug>(easymotion-F)

"Nerdtree
map <Leader>n :NERDTreeToggle<CR>

"Airline
let g:airline_symbols = {}
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

if has ("gui_running")
	set guioptions=agim
	set background=dark
	colorscheme solarized
	set guicursor+=a:blinkon0
	set guifont=Consolas\ 13
endif

set encoding=utf-8

vmap s d:call SubstituteWith()<CR>:exe "normal i".substitute_with<CR>q/p<CR>
fun! SubstituteWith()
	call inputsave()
	let g:substitute_with = input("Substitute with: ")
	call inputrestore()
endfun

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

if exists('*HexHighlight()')
  nmap <leader>h :call HexHighlight()<Return>
endif
