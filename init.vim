scriptencoding=utf-8


"    d888888b d8b   db d888888b d888888b    db    db d888888b .88b  d88. 
"      `88'   888o  88   `88'      88       88    88   `88'   88'YbdP`88 
"       88    88V8o 88    88       88       Y8    8P    88    88  88  88 
"       88    88 V8o88    88       88       `8b  d8'    88    88  88  88 
"      .88.   88  V888   .88.      88    db  `8bd8'    .88.   88  88  88 
"    Y888888P VP   V8P Y888888P    YP    VP    YP    Y888888P YP  YP  YP 
                                                                    

call plug#begin('~/.config/nvim/bundle/')

"" general
Plug 'Shougo/vimproc.vim', { 'do' : 'make' }
Plug 'itchyny/lightline.vim'
Plug 'itchyny/calendar.vim'

Plug 'mhinz/vim-startify'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-eunuch' " unix commands
Plug 'justinmk/vim-dirvish' " file browser
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim' 

"" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
Plug 'junegunn/fzf.vim' 

"" Colourscheme(s)
Plug 'altercation/vim-colors-solarized'

"" Text Editing
Plug 'Raimondi/delimitMate'
Plug 'chrisbra/unicode.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', { 'for' : 'markdown' }
Plug 'reedes/vim-pencil', { 'for' : ['markdown', 'tex', 'text'] }

"" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"" General coding
Plug 'eugen0329/vim-esearch'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-rooter', { 'for' : ['c', 'python', 'rust', 'sh', 'elixir', 'scala', 'tex'] }
Plug 'benekastah/neomake' 
Plug 'majutsushi/tagbar',   { 'on' : 'TagbarToggle' }
Plug 'Konfekt/FastFold'

"" deoplete 
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets' 

"" C (and C++)
Plug 'critiqjo/lldb.nvim',        { 'do': function('DoRemote'),  'for' : ['c', 'cpp'] }
Plug 'zchee/deoplete-clang',      { 'for' : ['c', 'cpp'] }
Plug 'Shougo/neoinclude.vim',     { 'for' : ['c', 'cpp'] }

"" Haskell
"Plug 'parsonsmatt/intero-neovim',   { 'for' : 'haskell' }
Plug 'eagletmt/neco-ghc',           { 'for' : 'haskell' }
Plug 'Twinside/vim-haskellFold',    { 'for' : 'haskell' }
Plug 'Twinside/vim-hoogle',         { 'for' : 'haskell' }
Plug 'Twinside/vim-haskellConceal', { 'for' : 'haskell' }
Plug 'itchyny/vim-haskell-indent',  { 'for' : 'haskell' }

"" Idris
Plug 'idris-hackers/idris-vim', { 'for' : 'idris' }

"" Coq
Plug 'the-lambda-church/coquille', { 'for' : 'coq' }

"" Python
Plug 'zchee/deoplete-jedi', { 'for' : 'python' }
Plug 'mitsuhiko/vim-python-combined', { 'for' : 'python' }

"" JavaScript
Plug 'carlitux/deoplete-ternjs', { 'for' : 'javascript' }

"" LaTeX
Plug 'lervag/vimtex', { 'for' : 'tex' }

"" Shell Scripting & Vim
Plug 'vim-scripts/sh.vim--Cla', { 'for' : 'sh' }
Plug 'zchee/deoplete-zsh',      { 'for' : 'sh' }
Plug 'Shougo/neco-vim',         { 'for' : 'vim' }
Plug 'Shougo/neco-syntax',      { 'for' : 'vim' }

"" Rust
Plug 'rust-lang/rust.vim',   { 'for' : 'rust' }
Plug 'rhysd/rust-doc.vim',   { 'for' : 'rust' }
Plug 'racer-rust/vim-racer', { 'for' : 'rust' }

"" elixir / erlang
Plug 'elixir-lang/vim-elixir', { 'for' : 'elixir' }
Plug 'awetzel/elixir.nvim',    { 'for' : 'elixir' }

"" scala
Plug 'derekwyatt/vim-scala', { 'for' : 'scala' }

"" fsharp
Plug 'fsharp/vim-fsharp', { 'for': 'fsharp', 'do':  'make fsautocomplete', }

"" mml
Plug '~/Programming/Haskell/microML/utils/microML.vim'
"Plug '~/Programming/Python/deoplete-microML'

"" wordnet wip
Plug 'kellino/wordnet.nvim', { 'for' : ['tex', 'text', 'markdown'] }

call plug#end()

filetype plugin indent on


 "======================="
 "      Appearance       "
 "======================="

set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=1
colorscheme solarized

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

hi SpellBad ctermfg=1
hi SpellCap ctermfg=9
hi SpellRare cterm=undercurl
hi SpellLocal cterm=undercurl
hi FoldColumn ctermbg=235
hi LineNr ctermfg=200
hi Comment cterm=italic

"" italics
set t_ZH=3m
set t_ZR=23m


 "======================="
 "      Navigation       "
 "======================="

"" unbind ESC
inoremap fj <Esc>

"" Switch between splits
set splitbelow
set splitright
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
" don't allow vim to resize splits
set noequalalways

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
set nohlsearch
set wrapscan

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
set wildmenu
set wildmode=longest,list:longest,full
set wildignore=*.o,*~,*.pyc,.git/*
set shortmess=aoOtT

"" Tab
noremap <Leader>to :tabnew<CR>
noremap <Leader>tt :tabclose<CR>

"" Copy / Paste
map yy "*y
map pp "*p

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

"" Recursively search for tagfiles
set tags=./tags;

"" formatting
set formatprg=par\ -w100
set equalprg=par\ -w100

"" spelling
augroup spelling
    au BufRead *.md    setlocal spell spelllang=en_gb
    au BufRead *.tex   setlocal spell spelllang=en_gb
    au BufRead *.latex setlocal spell spelllang=en_gb
augroup END

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

"" Neomake
augroup Neomake
    autocmd! BufWritePost * Neomake
augroup END

"" easymotion
nmap <Leader>s  <Plug>(easymotion-s2)
map  <Leader>f  <Plug>(easymotion-bd-f)
nmap <Leader>f  <Plug>(easymotion-overwin-f)
map  <Leader>li <Plug>(easymotion-bd-jk)
nmap <Leader>li <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>W <Plug>(easymotion-bd-w)
nmap <Leader>W <Plug>(easymotion-overwin-w)

"" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#omni_patterns = {}

" rust
let g:deoplete#omni_patterns.rust = '[(\.)(::)]'

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" neosnippet
imap <s-tab> <Plug>(neosnippet_expand_or_jump)
smap <s-tab> <Plug>(neosnippet_expand_or_jump)
xmap <s-tab> <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang/'
let g:deoplete#sources#clang#std#cpp = 'c++11'
let g:deoplete#sources#clang#sort_algo = 'priority'

let g:neosnippet#enable_snipmate_compatibility=1
let g:neosnippet#snippets_directory='~/.config/nvim/after/snippets'

"" ESearch
let g:esearch = {
    \ 'adapter':    'ag',
    \ 'backend':    'nvim',
    \ 'out':        'win',
    \ 'batch_size': 1000,
    \ 'use':      ['visual', 'hlsearch', 'last'],
    \}

"" Unicode
map md <Plug>(MakeDigraph)
nmap ga <Plug>(UnicodeGA)

"" Tagbar
map <F8> :TagbarToggle<CR>

"" tern
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0

"" vim calendar
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

"" tabular
vmap a= :Tabularize /=<CR>
vmap a> :Tabularize /-><CR>

" latex settings
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = 
        \   '\\(?:'
        \  .   '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
        \  .  '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
        \  .  '|hyperref\s*\[[^]]*'
        \  .  '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \  .  '|(?:include(?:only)?|input)\s*\{[^}]*'
        \  .')'

let g:tex_flavor = 'latex'
let g:tex_stylish = 1
let g:vimtex_view_method = 'zathura'
let g:vimtex_index_split_pos = 'below'
let g:vimtex_fold_enabled=1

" other stuff
try
    source ~/.config/nvim/config/lightline.vim
    source ~/.config/nvim/config/haskell.vim
    source ~/.config/nvim/config/terminal.vim
    source ~/.config/nvim/config/startify.vim
    source ~/.config/nvim/config/rust.vim
    source ~/.config/nvim/config/elixir.vim
    source ~/.config/nvim/config/ml.vim
catch
endtry
