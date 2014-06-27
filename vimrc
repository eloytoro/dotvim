"Useful vim tips
" vit <xml>(text)</xml>
" vat (<xml>text</xml>)

execute pathogen#infect()

syntax enable
"colorscheme distinguished
"colorscheme BusyBee
"colorscheme herald
colorscheme jellybeans

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
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
nnoremap gR yiw:s/<C-R>"//gc<left><left><left>
map <F2> :source ~/.vimrc<CR>
nmap <Space><Space> o<Esc>
inoremap {<CR> {<CR><CR>}<Up><Esc>cc
inoremap (<CR> (<CR><CR>)<Up><Esc>cc
"switch L and H with ^ and $
nnoremap ^ L
nnoremap $ H
nnoremap L $
nnoremap H ^
vnoremap ^ L
vnoremap $ H
vnoremap L $h
vnoremap H ^
nnoremap yL y$
nnoremap yH y^
"unnecesary yank register overwrites
nmap cd :cd %:p:h<CR>
"window controls
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l
map <C-Down> 2<C-W>-
map <C-Up> 2<C-W>+
map <C-Right> 2<C-W>>
map <C-Left> 2<C-W><

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
map  <Space>w <Plug>(easymotion-bd-w)
map  <Space>W <Plug>(easymotion-bd-W)
map  <Space>/ <Plug>(easymotion-sn)
map  <Space>n <Plug>(easymotion-bd-n)
map  <Space>j <Plug>(easymotion-bd-jk)
map  <Space>k <Plug>(easymotion-bd-jk)
map  <Space>l <Plug>(easymotion-lineanywhere)
map  <Space>h <Plug>(easymotion-lineanywhere)
map  <Space>f <Plug>(easymotion-s)
map  <Space>e <Plug>(easymotion-jumptoanywhere)

"Nerdtree
map <Leader>n :NERDTreeToggle<CR>

"Airline
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

"Easyclip
let g:EasyClipUseSubstituteDefaults = 1
let g:EasyClipAlwaysMoveCursorToEndOfPaste = 1
let g:EasyClipAutoFormat = 1


if has ("gui_running")
	set guioptions=agim
	set background=dark
	colorscheme Tomorrow-Night
	set guicursor+=a:blinkon0
	set guifont=Consolas:h13
endif

set encoding=utf-8

nmap <Leader>s :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
