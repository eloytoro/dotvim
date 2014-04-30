execute pathogen#infect()

"Some comment
syntax enable
colorscheme distinguished
set backspace=2
set rnu
set showcmd 		
set ruler 				
set showmatch               
set scrolloff=2   			
set wrap
set linebreak
set breakat-=*
set cursorline

"maps
nmap <CR> o<Esc>
map <F2> :source ~/.vimrc<CR>
nmap K i<CR><Esc>
nmap L $
nmap H ^
vmap p "_dP

"Uses the ("r) register to replace things
nnoremap gn gn"_dPn
vnoremap n "tyq/"tp<CR>gn

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

set incsearch
set wildmenu
filetype plugin indent on
let g:html_indent_inctags = "html,body,head,tbody"
"set hlsearch

set shiftwidth=4
set tabstop=4
au BufReadPost *.rkt,*.rktl set filetype=scheme
au filetype racket set lisp
au filetype racket set autoindent

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
map  <Space>s <Plug>(easymotion-f)

"Nerdtree
map <Leader>n :NERDTreeToggle<CR>

if has ("gui_running")
	set guioptions=agim
	set background=dark
	colorscheme solarized
	set guicursor+=a:blinkon0
	set guifont=Consolas
endif


set encoding=utf-8

let g:syntastic_java_javac_config_file_enabled = 1
