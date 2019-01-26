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
Plug 'Lenovsky/nuake'

"" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

"" Colourscheme(s)
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/limelight.vim'

"" Text Editing
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
"Plug 'SidOfc/mkdx', { 'for' : 'markdown' }

"" Git
Plug 'tpope/vim-fugitive' | Plug 'airblade/vim-gitgutter'

"" General coding
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh', }

"" Completions
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
Plug 'ncm2/ncm2-neoinclude' | Plug 'Shougo/neoinclude.vim'

""
Plug 'vim-scripts/cup.vim'

"" hex
Plug 'fidian/hexmode'

"" typescript
Plug 'HerringtonDarkholme/yats.vim'

"" Haskell
Plug 'neovimhaskell/haskell-vim',     { 'for' : 'haskell' }

"" Agda
Plug 'derekelkins/agda-vim', { 'for' : 'agda' }

"" LaTeX
Plug 'lervag/vimtex',     { 'for' : ['tex', 'latex'] }

"" Coq
Plug 'https://framagit.org/tyreunom/coquille.git', { 'branch' : 'pathogen-bundle', 'for' : 'coq'}

"" Shell Scripting & Vim
Plug 'vim-scripts/sh.vim--Cla', { 'for' : 'sh' }
Plug 'Shougo/neco-vim',         { 'for' : 'vim' }

"" python
Plug 'numirias/semshi'

call plug#end()

"======================="
"      Appearance       "
"======================="

set termguicolors
set background=dark

let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'transparent_background': 1,
  \       'allow_italic': 1,
  \       'allow_bold': 1
  \     }
  \   }
  \ }

colorscheme PaperColor

"" coq colours
hi default CheckedByCoq ctermbg=10 guibg=#282828
hi default SentToCoq ctermbg=12 guibg=#383c36


"======================="
"       Spelling        "
"======================="

set spelllang=en_gb
set spellfile=$HOME/.local/share/nvim/spell/en.add

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

"" change line numbering style
set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

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

noremap £ :norm i#<CR>

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
"

"" nuake
nnoremap <F5> :Nuake<CR>
inoremap <F5> <C-\><C-n>:Nuake<CR>
tnoremap <F5> <C-\><C-n>:Nuake<CR>
tnoremap fj <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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
    \ 'sh': ['bash-language-server', 'start'],
    \ 'python': ['pyls'],
    \ 'typescript' : ['typescript-language-server', '--stdio'],
    \ }

augroup Filetype typescript, sh, python
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
"let g:vimtex_compiler_progname='nvr'
let g:vimtex_view_method='skim'
let g:vimtex_index_split_pos = 'below'
let g:vimtex_fold_enabled=1

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

"" limelight
let g:limelight_conceal_guifg = '#777777'
let g:limelight_priority = -1

""
let g:ale_linters = { 
            \ 'sh' : ['language_server'],
\ }

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
let g:airline_theme='papercolor'

"" markdown
let g:mkdx#settings     = { 'highlight': { 'enable': 1 },
                        \ 'links': { 'external': { 'enable': 1 } },
                        \ 'toc': { 'text': 'Table of Contents', 'update_on_write': 1 },
                        \ 'fold': { 'enable': 1 } }
"" other stuff
try
   source ~/.local/share/nvim/config/startify.vim
catch
endtry
