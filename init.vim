scriptencoding=utf-8

"    d888888b d8b   db d888888b d888888b    db    db d888888b .88b  d88. 
"      `88'   888o  88   `88'      88       88    88   `88'   88'YbdP`88 
"       88    88V8o 88    88       88       Y8    8P    88    88  88  88 
"       88    88 V8o88    88       88       `8b  d8'    88    88  88  88 
"      .88.   88  V888   .88.      88    db  `8bd8'    .88.   88  88  88 
"    Y888888P VP   V8P Y888888P    YP    VP    YP    Y888888P YP  YP  YP 

call plug#begin('~/.local/share/nvim/plugged')

"" general
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'critiqjo/vim-bufferline'

Plug 'mhinz/vim-startify'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-eunuch' " unix commands
Plug 'justinmk/vim-sneak'
Plug 'haya14busa/incsearch.vim' 
Plug 'jamessan/vim-gnupg'
Plug 'eugen0329/vim-esearch'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-obsession'

"" Colourscheme(s)
Plug 'morhetz/gruvbox'
Plug 'iCyMind/NeoSolarized'
Plug 'junegunn/limelight.vim'

"" Text Editing
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'plasticboy/vim-markdown', { 'for' : 'markdown' }

"" Git
Plug 'tpope/vim-fugitive' | Plug 'airblade/vim-gitgutter'

"" General coding
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'

"" Code Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets' 
Plug 'Shougo/neco-syntax'

"" hex
Plug 'fidian/hexmode'

"" Haskell
Plug 'neovimhaskell/haskell-vim',     { 'for' : 'haskell' }
Plug 'Twinside/vim-hoogle',           { 'for' : 'haskell' }
Plug 'Twinside/vim-haskellFold',      { 'for' : 'haskell' }
Plug 'enomsg/vim-haskellConcealPlus', { 'for' : 'haskell' }

"" idris
Plug 'idris-hackers/idris-vim', { 'for' : 'idris' }

"" Agda
Plug 'derekelkins/agda-vim', { 'for' : 'agda' }

"" LaTeX
Plug 'lervag/vimtex',     { 'for' : ['tex', 'latex'] }

""
Plug 'https://framagit.org/tyreunom/coquille.git', { 'branch' : 'pathogen-bundle', 'for' : 'coq' }

"" C
Plug 'arakashic/chromatica.nvim', { 'for' : 'c' }
Plug 'zchee/deoplete-clang', { 'for' : 'c' }

"" Shell Scripting & Vim
Plug 'vim-scripts/sh.vim--Cla', { 'for' : 'sh' }
Plug 'Shougo/neco-vim',         { 'for' : 'vim' }

call plug#end()

"======================="
"      Appearance       "
"======================="

set termguicolors
set background=dark
let g:gruvbox_contrast_dark='none'
colorscheme gruvbox

"" coq colours
hi default CheckedByCoq ctermbg=10 guibg=#282828
hi default SentToCoq ctermbg=12 guibg=#383c36


"======================="
"      Navigation       "
"======================="

"" unbind ESC
inoremap fj <Esc>

"" undo undo (redo)
inoremap \U <c-r>

"" Switch between splits
set  splitbelow
set  splitright
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

set noequalalways  " don't allow vim to resize splits
set cmdheight=2
set nowrap
set relativenumber
set number
set sidescrolloff=0
set autoindent
set copyindent
set textwidth=100
set noshowmode

"" tabs
set shiftwidth=4
set softtabstop=4
set expandtab

"" search
set ignorecase
set smartcase
set wrapscan
set nohlsearch

set scrolloff=10

set hidden

"" Remove backups
set nobackup
set nowritebackup
set noswapfile

set list
set listchars=tab:▸\ ,nbsp:%,extends:,precedes:
set linebreak
set completeopt=longest,menuone
set wildmode=longest,list:longest,full
set wildignore=*.o,*~,*.pyc,.git/*
set shortmess=aoOtT
set inccommand=split

"" Tab
noremap <Leader>to :tabnew<CR>
noremap <Leader>tt :tabclose<CR>

"" Copy / Paste
set clipboard+=unnamedplus
" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

""
let g:maplocalleader = ','

"" quick save and quit
map qq :wqa!<CR>
map qa :qa!<CR>
map <leader>w :w<CR>

"" History settings
set history=500

"" location window
map lo :lopen<CR>
map lc :lclose<CR>

"" Omnifunc completions
set omnifunc=syntaxcomplete#Complete

" conceal level
set conceallevel=2
set concealcursor=c

"" ctags / hasktags
set tags=./tags;


"============================="
"      Plugin Options         "
"============================="

"" tmux
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> : TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> : TmuxNavigateDown<cr>
nnoremap <silent> <c-k> : TmuxNavigateUp<cr>
nnoremap <silent> <BS>  : TmuxNavigateRight<cr>
nnoremap <silent> <c-p> : TmuxNavigatePrevious<cr>

"" vim-sneak
let g:sneak#label = 1

"" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)

"----------------"
"    Deoplete    "
"----------------"

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni#input_patterns = {}

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"" neosnippet
imap <s-tab> <Plug>(neosnippet_expand_or_jump)
smap <s-tab> <Plug>(neosnippet_expand_or_jump)
xmap <s-tab> <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
	\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:neosnippet#enable_snipmate_compatibility=1
let g:neosnippet#snippets_directory='~/.local/share/nvim/snippets/'


"========== 
"  latex 
"==========
"

if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = '\\(?:'
      \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
      \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
      \ . '|hyperref\s*\[[^]]*'
      \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
      \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|\w*'
\ .')'
let g:tex_flavor = 'latex'
let g:tex_stylish = 1
let g:vimtex_viewer_general = 'skim'
let g:vimtex_index_split_pos = 'below'
let g:vimtex_fold_enabled=1

"" esearch
let g:esearch = {
   \ 'adapter':    'rg',
   \ 'backend':    'nvim',
   \ 'out':        'win',
   \ 'batch_size': 1000,
   \ 'use':        ['visual', 'hlsearch', 'last'],
   \}

"" hexmode patterns
let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o'

"" easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"" gitgutter
let g:gitgutter_async=0

"" agda
let g:agda_extraincpaths = [ '~/.agda' ]
let g:NERDCustomDelimiters = { 'agda': { 'left': '{-', 'right': '-}', 'nested': 1, 'leftAlt': '--', 'nestedAlt': 1 } }

"" idris
let g:idris_indent_if = 3
let g:idris_indent_case = 5
let g:idris_indent_let = 4
let g:idris_indent_where = 6
let g:idris_indent_do = 3
let g:idris_indent_rewrite = 8
let g:idris_conceal = 1

"" libclang path
let g:deoplete#sources#clang#libclang_path='/usr/local/Cellar/llvm/HEAD-5e8f334/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header='/usr/local/Cellar/llvm/HEAD-5e8f334/lib/clang'
let g:chromatica#libclang_path='/usr/local/Cellar/llvm/HEAD-5e8f334/lib/libclang.dylib'
let g:chromatica#enable_at_startup=1

"" limelight
let g:limelight_conceal_guifg = '#777777'
let g:limelight_priority = -1

"" stuff for coq
function! CoqNormalise()
   call inputsave()
   let result = input('Enter expression: ')
   call CoqQuery("Compute " . result . ".")
   call inputrestore()
endfunction

function! CoqBindings()
    nnoremap<buffer><localleader>L :call CoqLaunch()<CR>
    nnoremap<buffer><localleader>N :call CoqNormalise()<CR>
    nnoremap<buffer><localleader>r :call CoqToCursor()<CR>
    nnoremap<buffer><localleader>K :call CoqStop()<CR>
    nnoremap<buffer><localleader>n :call CoqNext()<CR>
endfunction

function! CoqUTF8()
    imap <buffer> <LocalLeader>forall ∀
    imap <buffer> <LocalLeader>all ∀
    imap <buffer> <LocalLeader>exists ∃
    imap <buffer> <LocalLeader>eq ≡
    imap <buffer> <LocalLeader>leadsto ⇝
    imap <buffer> <LocalLeader>~> ⇝
    imap <buffer> <LocalLeader>lor ∨
    imap <buffer> <LocalLeader>land ∧
    imap <buffer> <LocalLeader>to →
    imap <buffer> <LocalLeader>- →

    cmap <buffer> <LocalLeader>forall ∀
    cmap <buffer> <LocalLeader>all ∀
    cmap <buffer> <LocalLeader>exists ∃
    cmap <buffer> <LocalLeader>eq ≡
    cmap <buffer> <LocalLeader>leadsto ⇝
    cmap <buffer> <LocalLeader>~> ⇝
    cmap <buffer> <LocalLeader>lor ∨
    cmap <buffer> <LocalLeader>land ∧
    cmap <buffer> <LocalLeader>to →
    cmap <buffer> <LocalLeader>- →
endfunction

augroup CoqStuff 
    au FileType coq call CoqBindings()
    au FileType coq call CoqUTF8()
augroup END

"" other stuff
try
   source ~/.local/share/nvim/config/lightline.vim
   source ~/.local/share/nvim/config/startify.vim
catch
endtry
