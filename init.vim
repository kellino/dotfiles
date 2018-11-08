scriptencoding=utf-8

"    d888888b d8b   db d888888b d888888b    db    db d888888b .88b  d88. 
"      `88'   888o  88   `88'      88       88    88   `88'   88'YbdP`88 
"       88    88V8o 88    88       88       Y8    8P    88    88  88  88 
"       88    88 V8o88    88       88       `8b  d8'    88    88  88  88 
"      .88.   88  V888   .88.      88    db  `8bd8'    .88.   88  88  88 
"    Y888888P VP   V8P Y888888P    YP    VP    YP    Y888888P YP  YP  YP 

call plug#begin('~/.config/nvim/bundle/')

"" general
Plug 'itchyny/lightline.vim'
Plug 'critiqjo/vim-bufferline'

Plug 'mhinz/vim-startify'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-eunuch' " unix commands
Plug 'tpope/vim-obsession' " save vim sessions
Plug 'justinmk/vim-sneak'
Plug 'haya14busa/incsearch.vim' 
Plug 'jamessan/vim-gnupg'
Plug 'eugen0329/vim-esearch'
Plug 'brooth/far.vim'
Plug 'junegunn/fzf.vim'

"" Colourscheme(s)
Plug 'fenetikm/falcon'
Plug 'dkasak/gruvbox'
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
    \ }

"" Completions
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
Plug 'ncm2/ncm2-neoinclude' | Plug 'Shougo/neoinclude.vim'
Plug 'ncm2/ncm2-match-highlight'

"" assembly
Plug 'fidian/hexmode'

"" nix
Plug 'LnL7/vim-nix', { 'for' : 'nix' }

"" tmux syntax
Plug 'tmux-plugins/vim-tmux', { 'for' : 'tmux' }

"" coq
Plug 'https://framagit.org/tyreunom/coquille.git', { 'branch' : 'pathogen-bundle', 'for' : 'coq' }

"" Haskell
Plug 'neovimhaskell/haskell-vim',     { 'for' : [ 'haskell' , 'agda' ] }
Plug 'Twinside/vim-haskellFold',      { 'for' : 'haskell' }
Plug 'Twinside/vim-hoogle',           { 'for' : 'haskell' }
Plug 'enomsg/vim-haskellConcealPlus', { 'for' : 'haskell' }
Plug 'itchyny/vim-haskell-indent',    { 'for' : 'haskell' }
"Plug 'parsonsmatt/intero-neovim',     { 'for' : 'haskell' }

"" Agda
Plug 'derekelkins/agda-vim', { 'for' : 'agda' }

"" Idris
Plug 'idris-hackers/idris-vim', { 'for' : 'idris' }

"" LaTeX
Plug 'lervag/vimtex',     { 'for' : ['tex', 'latex'] }

"" C
Plug 'arakashic/chromatica.nvim', { 'for' : 'c' }

"" Shell Scripting & Vim
Plug 'vim-scripts/sh.vim--Cla', { 'for' : 'sh' }
Plug 'dag/vim-fish',            { 'for' : 'fish' }

call plug#end()

 "======================="
 "      Appearance       "
 "======================="

set termguicolors
set background=dark
let g:gruvbox_contrast_dark='none'
let g:gruvbox_italics=1
colorscheme gruvbox

set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

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
"set completeopt=longest,menuone
set wildmode=longest,list:longest,full
set wildignore=*.o,*~,*.pyc,.git/*
set shortmess=aoOtT
set inccommand=split

"" Tab
noremap <Leader>to :tabnew<CR>
noremap <Leader>tt :tabclose<CR>

"" Copy / Paste
set clipboard+=unnamedplus
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

"" localleader
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
"
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'haskell': ['hie-wrapper'],
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

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


"" vimtex
let g:vimtex_view_method = 'zathura'
let g:vimtex_index_split_pos = 'below'
let g:vimtex_fold_enabled=1

"" far
let g:far#source='rgnvim'

"" esearch
let g:esearch = {
  \ 'adapter':    'rg',
  \ 'backend':    'nvim',
  \ 'out':        'win',
  \ 'batch_size': 1000,
  \ 'use':        ['visual', 'hlsearch', 'last'],
  \}

"" hexmode
let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o'

"" easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"" gitgutter
let g:gitgutter_async=0

"" agda
let g:agda_extraincpaths = [ '/home/david/.agda/' ]
let g:NERDCustomDelimiters = { 'agda': { 'left': '{-', 'right': '-}', 'nested': 1, 'leftAlt': '--', 'nestedAlt': 1 } }

function! AgdaLoad()
    map <buffer><silent><localleader>w :Load<CR>
endfunction
au FileType agda call AgdaLoad()

"" idris
let g:idris_indent_if=3
let g:idris_indent_case=5
let g:idris_indent_let=4
let g:idris_indent_where=6
let g:idris_indent_do=3
let g:idris_indent_rewrite=8
let g:idris_conceal=1

"" coq
hi default CheckedByCoq ctermbg=10 guibg=#282828
hi default SentToCoq ctermbg=12 guibg=#383c36

function! CoqFunction(prompt, command)
    call inputsave()
    let l:arg = input(a:prompt)
    call CoqQuery(a:command . " " . arg . ".")
    call inputrestore()
endfunction

function! CoqMapping()
    map <buffer><silent><localleader>L :call CoqLaunch()<CR>
    map <buffer><silent><localleader>K :call CoqStop()<CR>
    map <buffer><silent><localleader>u :call CoqUndo()<CR>
    map <buffer><silent><localleader>r :call CoqNext()<CR>
    map <buffer><silent><localleader>l :call CoqToCursor()<CR>
    map <buffer><silent><localleader>n :call CoqFunction('Enter expression: ', 'Compute')<CR>
    map <buffer><silent><localleader>t :call CoqFunction('Check: ', 'Check')<CR>
    map <buffer><silent><localleader>p :call CoqFunction('Print: ', 'Print')<CR>
    map <buffer><silent><localleader>s :call CoqFunction('Search: ', 'Search')<CR>
endfunction

" let's use the utf8 bindings from the agda plugin
function! CoqUTF8()
    runtime coq-utf8.vim
endfunction

augroup CoqStuff
    au FileType coq call CoqMapping()
    au FileType coq call CoqUTF8()
augroup END

"" C
let g:neoinclude#paths = {}
let g:neoinclude#paths.c = '/nix/store/fn2x7v3bs305xl55ynj698mjc0yfn1lh-glibc-2.26-131-dev/include/'
let g:chromatica#libclang_path='/nix/store/6gkylaxm6s553jh60al5mm1ykj3nf6g0-clang-6.0.0-lib/lib/libclang.so'
let g:chromatica#enable_at_startup=1
let g:deoplete#sources#clang#libclang_path='/nix/store/6gkylaxm6s553jh60al5mm1ykj3nf6g0-clang-6.0.0-lib/lib/libclang.so'
let g:deoplete#sources#clang#clang_header='/nix/store/lhkaxa2lfpa56icqbahxbxa3dfrman3j-clang-6.0.0/lib/clang/6.0.0/include/'

"" limelight
let g:limelight_conceal_guifg = '#777777'
let g:limelight_priority = -1

"" scheme
let b:is_chicken=1

"" other stuff
try
    source ~/.config/nvim/config/lightline.vim
    source ~/.config/nvim/config/startify.vim
catch
endtry
