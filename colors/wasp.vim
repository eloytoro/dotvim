" Vim color file - wasp
" Generated by http://bytefluent.com/vivify 2014-02-09
set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "wasp"

"hi   IncSearch               --              no              settings        --
"hi   WildMenu                --              no              settings        --
"hi   SignColumn              --              no              settings        --
hi    SpecialComment          guifg=#ff9800   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=208    ctermbg=NONE   cterm=NONE
hi    Typedef                 guifg=#7e8aa2   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=103    ctermbg=NONE   cterm=NONE
hi    Title                   guifg=#f6f3e8   guibg=NONE      guisp=NONE      gui=bold   ctermfg=230    ctermbg=NONE   cterm=bold
hi    Folded                  guifg=#a0a8b0   guibg=#384048   guisp=#384048   gui=NONE   ctermfg=103    ctermbg=238    cterm=NONE
hi    PreCondit               guifg=#ff99df   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=212    ctermbg=NONE   cterm=NONE
hi    Include                 guifg=#faf4c6   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=230    ctermbg=NONE   cterm=NONE
"hi   TabLineSel              --              no              settings        --
hi    StatusLineNC            guifg=#939395   guibg=#303030   guisp=#303030   gui=NONE   ctermfg=246    ctermbg=236    cterm=NONE
"hi   CTagsMember             --              no              settings        --
hi    NonText                 guifg=#3b3b3b   guibg=#0f0f0f   guisp=#0f0f0f   gui=NONE   ctermfg=237    ctermbg=233    cterm=NONE
"hi   CTagsGlobalConstant     --              no              settings        --
"hi   DiffText                --              no              settings        --
"hi   ErrorMsg                --              no              settings        --
"hi   Ignore                  --              no              settings        --
hi    Debug                   guifg=#ff9800   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=208    ctermbg=NONE   cterm=NONE
hi    PMenuSbar               guifg=NONE      guibg=#202020   guisp=#202020   gui=NONE   ctermfg=NONE   ctermbg=234    cterm=NONE
hi    Identifier              guifg=#afd465   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=149    ctermbg=NONE   cterm=NONE
hi    SpecialChar             guifg=#ff9800   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=208    ctermbg=NONE   cterm=NONE
hi    Conditional             guifg=#7e8aa2   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=103    ctermbg=NONE   cterm=NONE
hi    StorageClass            guifg=#7e8aa2   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=103    ctermbg=NONE   cterm=NONE
hi    Todo                    guifg=#8f8f8f   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=245    ctermbg=NONE   cterm=NONE
hi    Special                 guifg=#e89c4b   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=215    ctermbg=NONE   cterm=NONE
hi    LineNr                  guifg=#3b3b3b   guibg=#0f0f0f   guisp=#0f0f0f   gui=NONE   ctermfg=237    ctermbg=233    cterm=NONE
hi    StatusLine              guifg=#d3d3d5   guibg=#303030   guisp=#303030   gui=NONE   ctermfg=188    ctermbg=236    cterm=NONE
hi    Normal                  guifg=#ffffff   guibg=#0f0f0f   guisp=#0f0f0f   gui=NONE   ctermfg=15     ctermbg=233    cterm=NONE
hi    Label                   guifg=#7e8aa2   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=103    ctermbg=NONE   cterm=NONE
"hi   CTagsImport             --              no              settings        --
hi    PMenuSel                guifg=#ffffff   guibg=#6161d6   guisp=#6161d6   gui=NONE   ctermfg=15     ctermbg=62     cterm=NONE
"hi   Search                  --              no              settings        --
"hi   CTagsGlobalVariable     --              no              settings        --
hi    Delimiter               guifg=#ff9800   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=208    ctermbg=NONE   cterm=NONE
hi    Statement               guifg=#878bd6   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=104    ctermbg=NONE   cterm=NONE
"hi   SpellRare               --              no              settings        --
"hi   EnumerationValue        --              no              settings        --
hi    Comment                 guifg=#565656   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=239    ctermbg=NONE   cterm=NONE
hi    Character               guifg=#ff9800   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=208    ctermbg=NONE   cterm=NONE
hi    Float                   guifg=#ff9800   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=208    ctermbg=NONE   cterm=NONE
hi    Number                  guifg=#e89c4b   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=215    ctermbg=NONE   cterm=NONE
hi    Boolean                 guifg=#b1d631   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=149    ctermbg=NONE   cterm=NONE
hi    Operator                guifg=#f8fc7c   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=228    ctermbg=NONE   cterm=NONE
hi    CursorLine              guifg=NONE      guibg=#202020   guisp=#202020   gui=NONE   ctermfg=NONE   ctermbg=234    cterm=NONE
"hi   Union                   --              no              settings        --
"hi   TabLineFill             --              no              settings        --
"hi   Question                --              no              settings        --
"hi   WarningMsg              --              no              settings        --
"hi   VisualNOS               --              no              settings        --
"hi   DiffDelete              --              no              settings        --
"hi   ModeMsg                 --              no              settings        --
hi    CursorColumn            guifg=NONE      guibg=#202020   guisp=#202020   gui=NONE   ctermfg=NONE   ctermbg=234    cterm=NONE
hi    Define                  guifg=#faf4c6   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=230    ctermbg=NONE   cterm=NONE
hi    Function                guifg=#f75959   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=203    ctermbg=NONE   cterm=NONE
"hi   FoldColumn              --              no              settings        --
hi    PreProc                 guifg=#fbff7a   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=228    ctermbg=NONE   cterm=NONE
"hi   EnumerationName         --              no              settings        --
hi    Visual                  guifg=#faf4c6   guibg=#3c414c   guisp=#3c414c   gui=NONE   ctermfg=230    ctermbg=239    cterm=NONE
"hi   MoreMsg                 --              no              settings        --
"hi   SpellCap                --              no              settings        --
hi    VertSplit               guifg=#444444   guibg=#303030   guisp=#303030   gui=NONE   ctermfg=238    ctermbg=236    cterm=NONE
hi    Exception               guifg=#7e8aa2   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=103    ctermbg=NONE   cterm=NONE
hi    Keyword                 guifg=#e89c4b   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=215    ctermbg=NONE   cterm=NONE
hi    Type                    guifg=#aecc6c   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=149    ctermbg=NONE   cterm=NONE
"hi   DiffChange              --              no              settings        --
hi    Cursor                  guifg=NONE      guibg=#626262   guisp=#626262   gui=NONE   ctermfg=NONE   ctermbg=241    cterm=NONE
"hi   SpellLocal              --              no              settings        --
"hi   Error                   --              no              settings        --
hi    PMenu                   guifg=#ffffff   guibg=#202020   guisp=#202020   gui=NONE   ctermfg=15     ctermbg=234    cterm=NONE
hi    SpecialKey              guifg=#808080   guibg=#343434   guisp=#343434   gui=NONE   ctermfg=8      ctermbg=236    cterm=NONE
hi    Constant                guifg=#e89c4b   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=215    ctermbg=NONE   cterm=NONE
"hi   DefinedName             --              no              settings        --
hi    Tag                     guifg=#ff9800   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=208    ctermbg=NONE   cterm=NONE
hi    String                  guifg=#606060   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=59     ctermbg=NONE   cterm=NONE
hi    PMenuThumb              guifg=NONE      guibg=#303030   guisp=#303030   gui=NONE   ctermfg=NONE   ctermbg=236    cterm=NONE
hi    MatchParen              guifg=#d0ffc0   guibg=#202020   guisp=#202020   gui=bold   ctermfg=193    ctermbg=234    cterm=bold
"hi   LocalVariable           --              no              settings        --
hi    Repeat                  guifg=#7e8aa2   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=103    ctermbg=NONE   cterm=NONE
"hi   SpellBad                --              no              settings        --
"hi   CTagsClass              --              no              settings        --
"hi   Directory               --              no              settings        --
hi    Structure               guifg=#7e8aa2   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=103    ctermbg=NONE   cterm=NONE
hi    Macro                   guifg=#faf4c6   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=230    ctermbg=NONE   cterm=NONE
"hi   Underlined              --              no              settings        --
"hi   DiffAdd                 --              no              settings        --
"hi   TabLine                 --              no              settings        --
hi    cursorim                guifg=#192224   guibg=#536991   guisp=#536991   gui=NONE   ctermfg=235    ctermbg=60     cterm=NONE
"hi   clear                   --              no              settings        --
hi    pythonimport            guifg=#009000   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=28     ctermbg=NONE   cterm=NONE
hi    pythonexception         guifg=#f00000   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=196    ctermbg=NONE   cterm=NONE
hi    pythonbuiltinfunction   guifg=#009000   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=28     ctermbg=NONE   cterm=NONE
hi    pythonoperator          guifg=#7e8aa2   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=103    ctermbg=NONE   cterm=NONE
hi    pythonexclass           guifg=#009000   guibg=NONE      guisp=NONE      gui=NONE   ctermfg=28     ctermbg=NONE   cterm=NONE
