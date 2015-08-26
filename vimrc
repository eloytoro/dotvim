filetype off
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/bundle')

" Essential
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'gregsexton/gitv', { 'on': 'Gitv' }
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'svermeulen/vim-easyclip'
"Plug 'bling/vim-airline'
Plug 'justinmk/vim-sneak'
Plug 'Lokaltog/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'Raimondi/delimitMate'
Plug 'eloytoro/vim-istanbul'
Plug 'kien/ctrlp.vim'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
" Plug 'junegunn/fzf.vim'
" Optional
"Plug 'scrooloose/nerdcommenter'
"Plug 'kshenoy/vim-signature'
"Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
" Language specific
Plug '4dma/vim-blade', { 'for': 'blade' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript', 'branch': 'develop' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'raichoo/haskell-vim', { 'for': 'haskell' }
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
if $NVIM_TUI_ENABLE_TRUE_COLOR
    let g:indentLine_color_gui = '#252525'
    silent! colorscheme molokai
    hi StatusLine   guifg=#000000 guibg=#FFFFFF
    hi StatusLineNC guifg=#000000 guibg=#333333
    let colorscheme = split(split(system('cat ~/.kde/share/apps/konsole/Shell.profile | grep ColorScheme'), '=')[1], '\n')[0]
    let opacity = system('cat ~/.kde/share/apps/konsole/'.colorscheme.'.colorscheme | grep Opacity')
    if opacity =~ '0.'
        au VimEnter * hi Normal guibg=none          |
                    \ hi NonText guibg=none         |
                    \ hi LineNr guibg=none          |
                    \ hi CursorLineNr guibg=none    |
                    \ hi ColorColumn guibg=none     |
                    \ hi CursorLine guibg=none      |
                    \ hi GitGutterAdd guibg=none    |
                    \ hi GitGutterChange guibg=none |
                    \ hi GitGutterDelete guibg=none
    endif
    if has("gui_running")
        set guioptions=agim
        set guicursor+=a:blinkon0
        if has("mac")
            set guifont=Inconsolata:h14
        else
            set guifont=Inconsolata\ 11
        endif
    endif
else
    let g:seoul256_background = 233
    silent! colorscheme seoul256
    hi MatchParen ctermfg=yellow
    let g:indentLine_color_term = 234
    "let g:indentLine_color_term = 248
    hi ColorColumn ctermbg=234 guibg=#252525
    if system('cat ~/.config/terminator/config | grep background_type') =~ 'transparent'
        au VimEnter * hi Normal ctermbg=none      |
                    \ hi NonText ctermbg=none     |
                    \ hi LineNr ctermbg=none      |
                    \ hi CursorLineNr ctermbg=none|
                    \ hi ColorColumn ctermbg=none |
                    \ hi CursorLine ctermbg=none
    endif
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
set nolist
set expandtab smarttab
set virtualedit=block
set backupdir=~/.vim/backup
set directory=~/.vim/backup
set laststatus=2
set pastetoggle=<F7>
set splitbelow
set cursorline
set showbreak=↳\ 
set breakindent
set breakindentopt=sbr
set encoding=utf-8
set visualbell
set colorcolumn=80
set rtp+=~/.fzf
set formatoptions+=rojn
set cot=menuone,preview,longest
set diffopt=filler,vertical
set nohlsearch
function! S_modified()
    if &modified
        return '[!]'
    endif
    return ''
endfunction
set statusline=%f\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}\ %{S_modified()}\ %=%-14.(%l,%c%V%)\ %P

" ----------------------------------------------------------------------------
" Fix Indent
" ----------------------------------------------------------------------------
au BufReadPost *.ts set filetype=javascript
au BufReadPost *.rkt,*.rktl set filetype=scheme
au filetype racket set lisp
au filetype racket set autoindent
filetype plugin indent on
autocmd BufNewFile,BufRead *.blade.php set ft=html | set ft=phtml | set ft=blade " Fix blade auto-indent
autocmd BufReadPost quickfix nmap <buffer> <CR> :.cc<CR>

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
nmap <leader>q :cope<CR>
" <tab> for tab switcing
nnoremap <Tab> gt
nnoremap <S-Tab> gT
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
imap <C-e> <End>
inoremap <C-s> <C-O>:update<cr>
nnoremap <C-s> :update<cr>
inoremap <C-q> <esc>:q<cr>
nnoremap <C-q> :q<cr>

" ----------------------------------------------------------------------------
"   Moving lines | for quick line swapping purposes
" ----------------------------------------------------------------------------
nnoremap <silent> <C-k> :move-2<cr>
nnoremap <silent> <C-j> :move+<cr>
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
xnoremap <silent> <C-k> :move-2<cr>gv
xnoremap <silent> <C-j> :move'>+<cr>gvvnoremap <silent> <C-l> >gv
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
nmap <down> 2<C-W>-
nmap <up> 2<C-W>+
nmap <right> 2<C-W>>
nmap <left> 2<C-W><
nmap <C-w>- :sp<CR>
nmap <C-w>\ :vsp<CR>

" ----------------------------------------------------------------------------
"  Neovim
" ----------------------------------------------------------------------------
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    nmap <leader>t :tabnew\|te<CR>
    set ttimeout
    set ttimeoutlen=0
else
    set nocompatible
endif

" ----------------------------------------------------------------------------
"  Surround
" ----------------------------------------------------------------------------
nmap s{ ysil{
nmap s} ySil{

" ----------------------------------------------------------------------------
"  Sneak
" ----------------------------------------------------------------------------
nmap gs  <Plug>Sneak_s
omap gs  <Plug>Sneak_s
nmap gS <Plug>Sneak_S
omap gS <Plug>Sneak_S
hi SneakPluginTarget ctermbg=yellow ctermfg=black

" ----------------------------------------------------------------------------
"  Easymotion
" ----------------------------------------------------------------------------
nmap / <Plug>(easymotion-sn)
nmap n <Plug>(easymotion-next)
nmap N <Plug>(easymotion-prev)
nmap <CR> <Plug>(easymotion-bd-jk)
omap <CR> <Plug>(easymotion-bd-jk)
nmap gw <Plug>(easymotion-bd-w)
omap gw <Plug>(easymotion-bd-w)
nmap gW <Plug>(easymotion-bd-W)
omap gW <Plug>(easymotion-bd-W)
hi EasyMotionMoveHL ctermbg=yellow ctermfg=black
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_off_screen_search = 1
let g:EasyMotion_smartcase = 1

" ----------------------------------------------------------------------------
" Git
" ----------------------------------------------------------------------------
nmap <leader>gs :Gstatus<CR>gg<C-n>
nmap <leader>gd :Gvdiff<CR>
nmap <leader>gD :Gvdiff HEAD^<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gm :Gmerge<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gw :Gwrite<CR>
nmap <leader>ge :Gedit<CR>
nmap <leader>gE :Gvsplit<CR>
nmap <leader>gv :Gitv<cr>
nmap <leader>gV :Gitv!<cr>
nmap <leader>gg :Ggrep 
let g:Gitv_OpenHorizontal = 1
let g:Gitv_OpenPreviewOnLaunch = 1

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
" Explorer
" ----------------------------------------------------------------------------
map <Leader>n :NERDTreeToggle<CR>
au FileType * if &ft=="nerdtree" | silent! nunmap <buffer> mm | endif

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

" ----------------------------------------------------------------------------
" Easyclip
" ----------------------------------------------------------------------------
let g:EasyClipUseSubstituteDefaults = 1
let g:EasyClipPreserveCursorPositionAfterYank = 1
let g:EasyClipAutoFormat = 1
let g:EasyClipShareYanks = 1
let g:EasyClipUserPasteToggleDefaults = 0
let g:EasyClipUsePasteToggleDefaults = 0
nmap [y <Plug>EasyClipSwapPasteBackwards
nmap ]y <Plug>EasyClipSwapPasteForward
imap <c-v> <Plug>EasyClipInsertModePaste
set clipboard+=unnamedplus
nmap M mL

" ----------------------------------------------------------------------------
" Signature
" ----------------------------------------------------------------------------
let g:SignatureMap = { 'Leader' :  "$" }
let g:SignatureMarkOrder = "»\m"

" ----------------------------------------------------------------------------
" IndentLine
" ----------------------------------------------------------------------------
let g:indentLine_char = '¦'
let g:indentLine_faster = 1

" ----------------------------------------------------------------------------
"  CtrlP
" ----------------------------------------------------------------------------
set wildignore+=*/tmp/*,*.so,*.sw?,*.zip,*/vendor/*,*/bower_components/*,*/node_modules/*,*/dist/*
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
au FileType javascript let b:delimitMate_insert_eol_marker = 2
au FileType javascript let b:delimitMate_eol_marker = ";"

" ----------------------------------------------------------------------------
"  UltiSnips
" ----------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger = "<C-u>"
let g:UltiSnipsSnippetsDir = "~/.vim/snippets/UltiSnips"

" ----------------------------------------------------------------------------
"  E
" ----------------------------------------------------------------------------
command -nargs=1 E execute('silent! !mkdir -p "$(dirname "<args>")"') <Bar> e <args>

" ----------------------------------------------------------------------------
"  vim-commentary
" ----------------------------------------------------------------------------
map  gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine


" ----------------------------------------------------------------------------
" co? : Toggle options (inspired by unimpaired.vim)
" ----------------------------------------------------------------------------
function! s:map_change_option(...)
    let [key, opt] = a:000[0:1]
    let op = get(a:, 3, 'set '.opt.'!')
    execute printf("nnoremap co%s :%s<bar>echo '%s: '. &%s<cr>",
                \ key, op, opt, opt)
endfunction

call s:map_change_option('p', 'paste')
call s:map_change_option('n', 'number')
call s:map_change_option('w', 'wrap')
call s:map_change_option('h', 'hlsearch')
call s:map_change_option('m', 'mouse', 'let &mouse = &mouse == "" ? "a" : ""')
call s:map_change_option('t', 'textwidth',
            \ 'let &textwidth = input("textwidth (". &textwidth ."): ")<bar>redraw')
call s:map_change_option('b', 'background',
            \ 'let &background = &background == "dark" ? "light" : "dark"<bar>redraw')
nnoremap cogg :GitGutterLineHighlightsToggle<CR>

" ----------------------------------------------------------------------------
" <Leader>? | Google it
" ----------------------------------------------------------------------------
function! s:goog(pat)
    let q = '"'.substitute(a:pat, '["\n]', ' ', 'g').'"'
    let q = substitute(q, '[[:punct:] ]',
                \ '\=printf("%%%02X", char2nr(submatch(0)))', 'g')
    call system('google-chrome https://www.google.co.kr/search?q='.q)
endfunction

nnoremap <leader>? :call <SID>goog(getline("."))<cr>
xnoremap <leader>? "gy:call <SID>goog(@g)<cr>gv

if has('nvim')
    let $FZF_DEFAULT_OPTS .= ' --inline-info'
    let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
endif
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
inoremap <expr> <c-x><c-k> fzf#complete('cat /usr/share/dict/words')

" ----------------------------------------------------------------------------
" :Root | Change directory to the root of the Git repository
" ----------------------------------------------------------------------------
function! s:root()
    let root = systemlist('git rev-parse --show-toplevel')[0]
    if !v:shell_error
        execute 'lcd' root
        echo 'Changed directory to: '.root
    endif
endfunction
" au VimEnter * call s:root()

" ----------------------------------------------------------------------------
"  Allow for extra vim options
" ----------------------------------------------------------------------------
let s:local_vimrc = expand('%:p:h').'/.vimrc'
if filereadable(s:local_vimrc)
    execute 'source' s:local_vimrc
endif
