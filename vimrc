set nocompatible
filetype off

call plug#begin('~/.vim/bundle')

Plug 'eloytoro/jellybeans.vim'
Plug 'eloytoro/xoria256'
Plug 'eloytoro/web-snippets'
Plug 'SirVer/ultisnips'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'cakebaker/scss-syntax.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'svermeulen/vim-easyclip'
Plug 'bling/vim-airline'
Plug '4dma/vim-blade'
Plug 'kshenoy/vim-signature'
Plug 'Lokaltog/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'Raimondi/delimitMate'
Plug 'fholgado/minibufexpl.vim'

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
set visualbell
if has ("gui_running")
    set guioptions=agim
    set guicursor+=a:blinkon0
    set guifont=Inconsolata\ 13
endif

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
" For inserting new lines
nmap - o<Esc>
nmap _ O<Esc>
" Lazy macro creation
nnoremap Q @q
" <tab> for tab switcing
nnoremap <tab> gt
nnoremap <S-tab> gT
" cd changes directory to the current file's
nmap cd :cd %:p:h<CR>
" Retain cursor position on page scrolling
noremap <C-F> <C-D>
noremap <C-B> <C-U>
" switch L and H with ^ and $
omap H ^
omap L $
map H ^
map L $

" ----------------------------------------------------------------------------
"   Moving lines | for quick line swapping purposes
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
" Window Controls | much like hjkl but using the g prefix
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
let g:EasyMotion_do_mapping = 0
map  /         <Plug>(easymotion-sn)
omap /         <Plug>(easymotion-tn)
map  <Leader>l <Plug>(easymotion-lineanywhere)
omap <Leader>l <Plug>(easymotion-lineanywhere)
map  <Leader>w <Plug>(easymotion-bd-w)
omap <Leader>w <Plug>(easymotion-bd-w)
map  <Leader>W <Plug>(easymotion-bd-W)
omap <Leader>W <Plug>(easymotion-bd-W)
map  <Leader>f <Plug>(easymotion-s)
omap <Leader>f <Plug>(easymotion-s)
map  <Leader>j <Plug>(easymotion-bd-jk)
omap <Leader>j <Plug>(easymotion-bd-jk)
map  n         <Plug>(easymotion-next)
map  N         <Plug>(easymotion-prev)
map  <CR>      <Plug>(easymotion-repeat)
let  g:EasyMotion_enter_jump_first = 1
let  g:EasyMotion_smartcase = 1
hi   EasyMotionMoveHLDefault ctermfg=black ctermbg=yellow

" ----------------------------------------------------------------------------
" Git
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
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_detect_whitespace = 0
let g:airline_theme = 'jellybeans'

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
let g:SignatureMap = { 'Leader' :  "zm" }
let g:SignatureMarkOrder = ">\m"

" ----------------------------------------------------------------------------
" IndentLine
" ----------------------------------------------------------------------------
let g:indentLine_color_term = 234
let g:indentLine_char = '¦'
let g:indentLine_faster = 1

" ----------------------------------------------------------------------------
"  CtrlP
" ----------------------------------------------------------------------------
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*,*/bower_components/*,*/node_modules/*
"let g:ctrlp_match_window_bottom = 0
let g:ctrlp_mru_files = 1
let g:ctrlp_extensions = ['funky', 'line']
let g:ctrlp_funky_syntax_highlight = 1
nnoremap ? :CtrlPFunky<Cr>

" ----------------------------------------------------------------------------
"   DelimitMate
" ----------------------------------------------------------------------------
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1

" ----------------------------------------------------------------------------
"   UltiSnips
" ----------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<c-e>"

" ----------------------------------------------------------------------------
"  GitGutter
" ----------------------------------------------------------------------------
nmap <leader>gh :GitGutterLineHighlightsToggle<CR>
nmap <leader>gp <Plug>GitGutterPreviewHunk

" ----------------------------------------------------------------------------
"  MiniBufExpl
" ----------------------------------------------------------------------------
let g:miniBufExplCloseOnSelect = 1
let g:miniBufExplVSplit = 25
let g:miniBufExplorerAutoStart = 0
let g:miniBufExplCycleArround = 1
noremap ]b :MBEbn<CR>
noremap [b :MBEbp<CR>
noremap <leader>b :MBEToggle<CR>
