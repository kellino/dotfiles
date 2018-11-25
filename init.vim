scriptencoding=utf-8

"    d888888b d8b   db d888888b d888888b    db    db d888888b .88b  d88. 
"      `88'   888o  88   `88'      88       88    88   `88'   88'YbdP`88 
"       88    88V8o 88    88       88       Y8    8P    88    88  88  88 
"       88    88 V8o88    88       88       `8b  d8'    88    88  88  88 
"      .88.   88  V888   .88.      88    db  `8bd8'    .88.   88  88  88 
"    Y888888P VP   V8P Y888888P    YP    VP    YP    Y888888P YP  YP  YP 

call plug#begin('~/.local/share/nvim/plugged')

"" general
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'mhinz/vim-startify'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-eunuch' " unix commands
Plug 'justinmk/vim-sneak'
Plug 'haya14busa/incsearch.vim' 
Plug 'jamessan/vim-gnupg'
Plug 'tpope/vim-obsession'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

"" Colourscheme(s)
Plug 'morhetz/gruvbox'
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
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ 'for' : [ 'haskell', 'rust' ] }

"" Completions
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
Plug 'ncm2/ncm2-neoinclude' | Plug 'Shougo/neoinclude.vim'

"" hex
Plug 'fidian/hexmode'

"" Haskell
Plug 'neovimhaskell/haskell-vim',     { 'for' : 'haskell' }
Plug 'Twinside/vim-hoogle',           { 'for' : 'haskell' }
Plug 'Twinside/vim-haskellFold',      { 'for' : 'haskell' }

"" Agda
Plug 'derekelkins/agda-vim', { 'for' : 'agda' }

"" LaTeX
Plug 'lervag/vimtex',     { 'for' : ['tex', 'latex'] }

""
Plug 'https://framagit.org/tyreunom/coquille.git', { 'branch' : 'pathogen-bundle', 'for' : 'coq'}

"" C
Plug 'arakashic/chromatica.nvim', { 'for' : 'c' }

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
let g:gruvbox_italics=1
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

"" fzf
nnoremap <Leader>rg :Rg

"" vim-sneak
let g:sneak#label = 1

"" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)

"" Language Server
let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'haskell': ['hie-wrapper', '--lsp'],
    \ }

augroup Filetype haskell 
    nnoremap <localleader>lcm :call LanguageClient_contextMenu()<CR>
    map <localleader>lh :call LanguageClient#textDocument_hover()<CR>
    map <localleader>ld :call LanguageClient#textDocument_definition()<CR>
    map <localleader>lr :call LanguageClient#textDocument_rename()<CR>
    map <localleader>lf :call LanguageClient#textDocument_formatting()<CR>
    map <localleader>lR :call LanguageClient#textDocument_references()<CR>
    map <localleader>la :call LanguageClient#textDocument_codeAction()<CR>
    map <localleader>ls :call LanguageClient#textDocument_documentSymbol()<CR>
augroup END

"" ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set shortmess+=c
inoremap <c-c> <ESC>
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"" latex
let g:tex_flavor = 'latex'
let g:tex_stylish = 1

au Filetype tex call ncm2#register_source({
       \ 'name' : 'vimtex-cmds',
       \ 'priority': 8, 
       \ 'complete_length': -1,
       \ 'scope': ['tex'],
       \ 'matcher': {'name': 'prefix', 'key': 'word'},
       \ 'word_pattern': '\w+',
       \ 'complete_pattern': g:vimtex#re#ncm2#cmds,
       \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
       \ })
au Filetype tex call ncm2#register_source({
    \ 'name' : 'vimtex-labels',
    \ 'priority': 8, 
    \ 'complete_length': -1,
    \ 'scope': ['tex'],
    \ 'matcher': {'name': 'combine',
    \             'matchers': [
    \               {'name': 'substr', 'key': 'word'},
    \               {'name': 'substr', 'key': 'menu'},
    \             ]},
    \ 'word_pattern': '\w+',
    \ 'complete_pattern': g:vimtex#re#ncm2#labels,
    \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
    \ })
au Filetype tex call ncm2#register_source({
    \ 'name' : 'vimtex-files',
    \ 'priority': 8, 
    \ 'complete_length': -1,
    \ 'scope': ['tex'],
    \ 'matcher': {'name': 'combine',
    \             'matchers': [
    \               {'name': 'abbrfuzzy', 'key': 'word'},
    \               {'name': 'abbrfuzzy', 'key': 'abbr'},
    \             ]},
    \ 'word_pattern': '\w+',
    \ 'complete_pattern': g:vimtex#re#ncm2#files,
    \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
    \ })
au Filetype tex call ncm2#register_source({
    \ 'name' : 'bibtex',
    \ 'priority': 8, 
    \ 'complete_length': -1,
    \ 'scope': ['tex'],
    \ 'matcher': {'name': 'combine',
    \             'matchers': [
    \               {'name': 'prefix', 'key': 'word'},
    \               {'name': 'abbrfuzzy', 'key': 'abbr'},
    \               {'name': 'abbrfuzzy', 'key': 'menu'},
    \             ]},
    \ 'word_pattern': '\w+',
    \ 'complete_pattern': g:vimtex#re#ncm2#bibtex,
    \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
    \ })
let g:tex_flavor = 'latex'
let g:tex_stylish = 1
let g:vimtex_viewer_method='skim'
let g:vimtex_index_split_pos = 'below'
let g:vimtex_fold_enabled=1

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

"" libclang path
let g:deoplete#sources#clang#libclang_path='/usr/local/Cellar/llvm/HEAD-5e8f334/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header='/usr/local/Cellar/llvm/HEAD-5e8f334/lib/clang'
let g:chromatica#libclang_path='/usr/local/Cellar/llvm/HEAD-5e8f334/lib/libclang.dylib'
let g:chromatica#enable_at_startup=1

"" limelight
let g:limelight_conceal_guifg = '#777777'
let g:limelight_priority = -1

""
let g:ale_linters = { 'haskell' : ['hie'] }

"" stuff for coq
function! CoqFunction(prompt, command)
    call inputsave()
    let l:result = input(a:prompt)
    call CoqQuery(a:command . " " . result . ".")
    call inputrestore()
endfunction

function! CoqBindings()
    nnoremap<buffer><localleader>t :call CoqFunction("Check: ",  "Check")<CR>
    nnoremap<buffer><localleader>p :call CoqFunction("Print: ",  "Print")<CR>
    nnoremap<buffer><localleader>s :call CoqFunction("Search: ", "Search")<CR>
    nnoremap<buffer><localleader>L :call CoqLaunch()<CR>
    nnoremap<buffer><localleader>n :call CoqFunction("Enter expression: ", "Compute")<CR>
    nnoremap<buffer><localleader>r :call CoqNext()<CR>
    nnoremap<buffer><localleader>K :call CoqStop()<CR>
    nnoremap<buffer><localleader>l :call CoqToCursor()<CR>
endfunction

augroup CoqStuff 
    au FileType coq call CoqBindings()
    au FileType coq runtime coq-utf8.vim
augroup END

""
let g:airline_powerline_fonts=1

"" other stuff
try
   source ~/.local/share/nvim/config/startify.vim
catch
endtry
