set nocompatible
filetype off

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/bundle')

" Plugins
Plug 'eloytoro/web-snippets'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'svermeulen/vim-easyclip'
Plug 'bling/vim-airline'
Plug 'kshenoy/vim-signature'
Plug 'Lokaltog/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'kien/ctrlp.vim'
Plug 'eloytoro/ctrlp-todo'
Plug 'Raimondi/delimitMate'
Plug 'gregsexton/gitv', { 'on': 'Gitv' }
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
" Language specific
Plug '4dma/vim-blade', { 'for': 'blade' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript', 'branch': 'develop' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'othree/html5.vim', { 'for': 'html' }
" Colorschemes
Plug 'eloytoro/jellybeans.vim'
Plug 'eloytoro/xoria256'
Plug 'junegunn/seoul256.vim'
Plug 'tomasr/molokai'

call plug#end()

" ----------------------------------------------------------------------------
" Colorschemes
" ----------------------------------------------------------------------------
syntax enable
if has("gui_running")
    silent! colorscheme molokai
else
    let g:seoul256_background = 233
    silent! colorscheme seoul256
endif


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
    if has("mac")
        set guifont=Inconsolata:h14
    else
        set guifont=Inconsolata\ 11
    endif
endif
set colorcolumn=80
hi ColorColumn ctermbg=234 guibg=#252525

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
" change L and H to ^ and $
onoremap H ^
onoremap L $
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $
nnoremap <silent> ]b :bn<CR>
nnoremap <silent> [b :bp<CR>
nnoremap <silent> ]q :cn<CR>
nnoremap <silent> [q :cp<CR>
nnoremap <silent> <C-t> :tabnew<cr>

" ----------------------------------------------------------------------------
"   Moving lines | for quick line swapping purposes
" ----------------------------------------------------------------------------
nnoremap <silent> <C-k> :execute ":move ".max([0,         line('.') - 2])<cr>==
nnoremap <silent> <C-j> :execute ":move ".min([line('$'), line('.') + 1])<cr>==
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
vnoremap <silent> <C-k> :<C-U>execute "normal! gv:move ".max([0,         line("'<") - 2])."\n"<cr>gv
vnoremap <silent> <C-j> :<C-U>execute "normal! gv:move ".min([line('$'), line("'>") + 1])."\n"<cr>gv
vnoremap <silent> <C-l> >gv
vnoremap <silent> <C-h> <gv
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
function! MapMotion(key, plug)
    exe "map <leader>".a:key." <Plug>(".a:plug.")"
    exe "omap <leader>".a:key." ".a:plug
endfunction
call MapMotion("l", "easymotion-lineanywhere")
call MapMotion("w", "easymotion-bd-w")
call MapMotion("W", "easymotion-bd-W")
call MapMotion("f", "easymotion-s")
call MapMotion("t", "easymotion-bd-t")
call MapMotion("j", "easymotion-bd-jk")
call MapMotion("s", "easymotion-s2")
map  /         <Plug>(easymotion-sn)
map  n         <Plug>(easymotion-next)
map  N         <Plug>(easymotion-prev)
map  <CR>      <Plug>(easymotion-repeat)
let  g:EasyMotion_enter_jump_first = 1
let  g:EasyMotion_smartcase = 1
hi EasyMotionMoveHLDefault ctermfg=black ctermbg=yellow guifg=black guibg=yellow

" ----------------------------------------------------------------------------
" Git
" ----------------------------------------------------------------------------
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gvdiff<CR>
nmap <leader>gD :Gvdiff HEAD^<CR>
nmap <leader>gm :Gmerge<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gw :Gwrite<CR>
nmap <leader>ge :Gedit<CR>
nmap <leader>gE :Gvsplit<CR>
nmap <leader>gv :Gitv<cr>
nmap <leader>gV :Gitv!<cr>

" ----------------------------------------------------------------------------
"  GitGutter
" ----------------------------------------------------------------------------
nmap <leader>gh :GitGutterLineHighlightsToggle<CR>
nmap <leader>gp <Plug>GitGutterPreviewHunk
nmap <leader>ga <Plug>GitGutterStageHunk
nmap <leader>gr <Plug>GitGutterRevertHunk

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
if has("gui_running")
    let g:airline_theme = 'molokai'
else
    let g:airline_theme = 'jellybeans'
endif

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
let g:SignatureMap = { 'Leader' :  "$" }
let g:SignatureMarkOrder = "»\m"

" ----------------------------------------------------------------------------
" IndentLine
" ----------------------------------------------------------------------------
let g:indentLine_color_term = 234
let g:indentLine_color_gui = '#252525'
let g:indentLine_char = '¦'
let g:indentLine_faster = 1

" ----------------------------------------------------------------------------
"  CtrlP
" ----------------------------------------------------------------------------
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/bower_components/*,*/node_modules/*
"let g:ctrlp_match_window_bottom = 0
let g:ctrlp_mru_files = 1
let g:ctrlp_extensions = ['line', 'todo']
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_working_path_mode = 'ra'

" ----------------------------------------------------------------------------
"   DelimitMate
" ----------------------------------------------------------------------------
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1

" ----------------------------------------------------------------------------
"   Neocomplete
" ----------------------------------------------------------------------------
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#auto_completion_start_length = 3
